/***************************************************************************//**
 * @file
 * @brief Host side of the fixed-address split PoC.
 ******************************************************************************/

#include "cmsis_os2.h"
#include "split_interface.h"
#include "crypto_cli.h"

#include <stdbool.h>
#include <stdio.h>

static const split_interface_t *const non_legal =
  (const split_interface_t *)SPLIT_INTERFACE_ADDRESS;

static bool split_interface_is_valid(void)
{
  return (non_legal->magic == SPLIT_INTERFACE_MAGIC)
         && (non_legal->abi_version == SPLIT_INTERFACE_ABI_VERSION)
         && (non_legal->size == sizeof(*non_legal))
         && (non_legal->init != NULL)
         && (non_legal->process_action != NULL)
         && (non_legal->ccm_encrypt != NULL)
         && (non_legal->ccm_decrypt != NULL)
         && (non_legal->radio_test != NULL);
}

static void non_legal_process_task(void *argument)
{
  (void)argument;

  for (;;) {
    (void)non_legal->process_action();
    osDelay(1000U);
  }
}

void app_init(void)
{
  static const osThreadAttr_t process_task_attributes = {
    .name = "non_legal_process",
    .stack_size = 512U,
    .priority = osPriorityNormal,
  };

  if (!split_interface_is_valid()) {
    printf("split PoC: invalid module at 0x%08lx\r\n",
           (unsigned long)SPLIT_INTERFACE_ADDRESS);
    return;
  }

  sl_status_t status = non_legal->init();
  if (status != SL_STATUS_OK) {
    printf("split PoC: module init failed (0x%08lx)\r\n", (unsigned long)status);
    return;
  }
  status = crypto_cli_init(non_legal);
  if (status != SL_STATUS_OK) {
    printf("split PoC: crypto CLI init failed (0x%08lx)\r\n", (unsigned long)status);
    return;
  }
  printf("split PoC: module initialized\r\n");

  if (osThreadNew(non_legal_process_task, NULL, &process_task_attributes) == NULL) {
    printf("split PoC: process task creation failed\r\n");
  }
}

void app_process_action(void)
{
}
