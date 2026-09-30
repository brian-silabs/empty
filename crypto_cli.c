#include "crypto_cli.h"
#include "cmsis_os2.h"
#include "sl_cli.h"
#include "sl_cli_command.h"
#include "psa/crypto.h"
#include <stdio.h>
#include <string.h>

#define TEST_ITERATIONS 1000U
#define WORK_START 1U
#define WORK_DONE 2U

static const split_interface_t *non_legal;
static osThreadId_t radio_worker;
static osThreadId_t caller;
static sl_status_t radio_status;
static uint32_t radio_passed;

/* FIPS-197 AES-128 example through PSA (SE accelerated on EFR32MG24). */
static psa_status_t psa_aes_test(void)
{
  uint8_t key_bytes[] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
  };
  static const uint8_t plain[] = {
    0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
    0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff
  };
  static const uint8_t expected[] = {
    0x69, 0xc4, 0xe0, 0xd8, 0x6a, 0x7b, 0x04, 0x30,
    0xd8, 0xcd, 0xb7, 0x80, 0x70, 0xb4, 0xc5, 0x5a
  };
  psa_key_attributes_t attributes = PSA_KEY_ATTRIBUTES_INIT;
  psa_key_id_t key = 0;
  uint8_t output[16];
  size_t output_length = 0;
  psa_set_key_type(&attributes, PSA_KEY_TYPE_AES);
  psa_set_key_bits(&attributes, 128);
  psa_set_key_usage_flags(&attributes, PSA_KEY_USAGE_ENCRYPT);
  psa_set_key_algorithm(&attributes, PSA_ALG_ECB_NO_PADDING);
  /* Default lifetime is volatile: no persistent key or NVM writes. */
  psa_status_t status = psa_import_key(&attributes, key_bytes,
                                       sizeof(key_bytes), &key);
  psa_reset_key_attributes(&attributes);
  if (status != PSA_SUCCESS) { return status; }

  status = psa_cipher_encrypt(key, PSA_ALG_ECB_NO_PADDING,
                              plain, sizeof(plain), output, sizeof(output),
                              &output_length);
  if (status == PSA_SUCCESS
      && (output_length != sizeof(expected)
          || memcmp(output, expected, sizeof(expected)) != 0)) {
    status = PSA_ERROR_CORRUPTION_DETECTED;
  }
  psa_status_t destroy_status = psa_destroy_key(key);
  if (status == PSA_SUCCESS) { status = destroy_status; }
  return status;
}

static void run_radio_worker(void *argument)
{
  (void)argument;
  for (;;) {
    osThreadFlagsWait(WORK_START, osFlagsWaitAny, osWaitForever);
    radio_status = SL_STATUS_OK;
    for (radio_passed = 0; radio_passed < TEST_ITERATIONS; radio_passed++) {
      radio_status = non_legal->radio_test();
      if (radio_status != SL_STATUS_OK) { break; }
      osDelay(1U);
    }
    osThreadFlagsSet(caller, WORK_DONE);
  }
}

static void radio_test_command(sl_cli_command_arg_t *arguments)
{
  (void)arguments;
  sl_status_t status = non_legal->radio_test();
  printf("RADIOAES Green Power: %s (0x%08lx)\r\n",
         status == SL_STATUS_OK ? "PASS" : "FAIL", (unsigned long)status);
}

static void se_test_command(sl_cli_command_arg_t *arguments)
{
  (void)arguments;
  psa_status_t status = psa_aes_test();
  printf("PSA AES-128: %s (status %ld)\r\n",
         status == PSA_SUCCESS ? "PASS" : "FAIL", (long)status);
}

static void parallel_test_command(sl_cli_command_arg_t *arguments)
{
  (void)arguments;
  uint32_t psa_passed;
  psa_status_t status = PSA_SUCCESS;
  caller = osThreadGetId();
  osThreadFlagsClear(WORK_DONE);
  osThreadFlagsSet(radio_worker, WORK_START);
  for (psa_passed = 0; psa_passed < TEST_ITERATIONS; psa_passed++) {
    status = psa_aes_test();
    if (status != PSA_SUCCESS) { break; }
    osDelay(1U);
  }
  /* Keep the CLI serialized until the module worker finishes. */
  osThreadFlagsWait(WORK_DONE, osFlagsWaitAny, osWaitForever);
  printf("Concurrent test: RADIOAES %lu/%u (0x%08lx), PSA %lu/%u (status %ld)\r\n",
         (unsigned long)radio_passed, TEST_ITERATIONS, (unsigned long)radio_status,
         (unsigned long)psa_passed, TEST_ITERATIONS, (long)status);
}

static const sl_cli_command_info_t radio_command =
  SL_CLI_COMMAND(radio_test_command, "Green Power CCM encrypt/decrypt/MIC test",
                 "", { SL_CLI_ARG_END });
static const sl_cli_command_info_t se_command =
  SL_CLI_COMMAND(se_test_command, "Legal PSA AES known-answer test",
                 "", { SL_CLI_ARG_END });
static const sl_cli_command_info_t parallel_command =
  SL_CLI_COMMAND(parallel_test_command, "1000 RADIOAES and PSA tests in two tasks",
                 "", { SL_CLI_ARG_END });
static const sl_cli_command_entry_t commands[] = {
  { "radio_test", &radio_command, false },
  { "se_test", &se_command, false },
  { "crypto_parallel", &parallel_command, false },
  { NULL, NULL, false }
};
static sl_cli_command_group_t command_group = { { NULL }, false, commands };

sl_status_t crypto_cli_init(const split_interface_t *module)
{
  static const osThreadAttr_t attributes = {
    .name = "radio_ccm_test",
    .stack_size = 2048U,
    .priority = osPriorityNormal,
  };
  psa_status_t status = psa_crypto_init();
  if (status != PSA_SUCCESS) {
    printf("PSA init failed (status %ld)\r\n", (long)status);
    return SL_STATUS_FAIL;
  }
  non_legal = module;
  radio_worker = osThreadNew(run_radio_worker, NULL, &attributes);
  if (radio_worker == NULL) { return SL_STATUS_ALLOCATION_FAILED; }
  if (!sl_cli_command_add_command_group(sl_cli_default_handle, &command_group)) {
    osThreadTerminate(radio_worker);
    return SL_STATUS_FAIL;
  }
  return SL_STATUS_OK;
}
