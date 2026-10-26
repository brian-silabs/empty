/***************************************************************************//**
 * @file
 * @brief Host side of the fixed-address split PoC.
 ******************************************************************************/

#include "cmsis_os2.h"
#include "split_interface.h"
#include "crypto_cli.h"
#include "em_core.h"
#include "em_device.h"

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#define VECTOR_TABLE_ENTRIES (16U + EXT_IRQ_COUNT)

extern const uint32_t __VECTOR_TABLE[];

static uint32_t ram_vector_table[VECTOR_TABLE_ENTRIES] __ALIGNED(512);

static const split_interface_t *const non_legal =
  (const split_interface_t *)SPLIT_INTERFACE_ADDRESS;

static void replace_radio_isr_in_vector_table(void)
{
  uint32_t primask = __get_PRIMASK();
  __disable_irq();

  /* Copy the active table before moving VTOR to the RAM copy. */
  const uint32_t *source = (const uint32_t *)(uintptr_t)SCB->VTOR;

  for (uint32_t i = 0; i < VECTOR_TABLE_ENTRIES; ++i) {
    ram_vector_table[i] = source[i];
  }

  SCB->VTOR = (uint32_t)(uintptr_t)ram_vector_table;
  __DSB();
  __ISB();

  /* Change only these IRQ entries. Bit 0 is the Cortex-M Thumb bit. */
  ram_vector_table[16U + (uint32_t)RFECA0_IRQn] = 0x08108EB9U;
  ram_vector_table[16U + (uint32_t)RFECA1_IRQn] = 0x08108EBFU;
  ram_vector_table[16U + (uint32_t)FRC_PRI_IRQn] = 0x08108ECBU;
  ram_vector_table[16U + (uint32_t)BUFC_IRQn] = 0x08108ECFU;
  ram_vector_table[16U + (uint32_t)PROTIMER_IRQn] = 0x08108ED3U;
  ram_vector_table[16U + (uint32_t)RAC_SEQ_IRQn] = 0x08108ED7U;
  ram_vector_table[16U + (uint32_t)MODEM_IRQn] = 0x08108EE5U;

  __DSB();
  __ISB();

  if (primask == 0U) {
    __enable_irq();
  }
}

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
    .stack_size = 8192U,
    .priority = osPriorityNormal,
  };

  if (!split_interface_is_valid()) {
    printf("split PoC: invalid module at 0x%08lx\r\n",
           (unsigned long)SPLIT_INTERFACE_ADDRESS);
    return;
  }

  replace_radio_isr_in_vector_table();

  sl_status_t status = non_legal->init();
  if (status != SL_STATUS_OK) {
    printf("split PoC: module init failed (0x%08lx)\r\n",
           (unsigned long)status);
    return;
  }

  status = crypto_cli_init(non_legal);
  if (status != SL_STATUS_OK) {
    printf("split PoC: crypto CLI init failed (0x%08lx)\r\n",
           (unsigned long)status);
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