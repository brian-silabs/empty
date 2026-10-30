/***************************************************************************//**
 * @file
 * @brief Host side of the fixed-address split PoC.
 ******************************************************************************/

#include "cmsis_os2.h"
#include "FreeRTOS.h"
#include "task.h"
#include "split_interface.h"
#include "crypto_cli.h"
#include "em_core.h"
#include "em_device.h"

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#define VECTOR_TABLE_ENTRIES (16U + EXT_IRQ_COUNT)

static uint32_t ram_vector_table[VECTOR_TABLE_ENTRIES] __ALIGNED(512);

static const split_interface_t *const non_legal =
  (const split_interface_t *)SPLIT_INTERFACE_ADDRESS;

#define NON_LEGAL_PROCESS_STACK_BYTES 8192U
static StackType_t non_legal_process_stack[
  NON_LEGAL_PROCESS_STACK_BYTES / sizeof(StackType_t)];
static StaticTask_t non_legal_process_tcb;

/* Inspect in the debugger; osThreadGetStackSpace reports bytes. */
volatile uint32_t non_legal_process_stack_free_bytes;

static sl_status_t install_non_legal_radio_isrs(void)
{
  static const IRQn_Type radio_irqs[] = {
    AGC_IRQn, BUFC_IRQn, FRC_PRI_IRQn, FRC_IRQn, MODEM_IRQn,
    PROTIMER_IRQn, RAC_RSM_IRQn, RAC_SEQ_IRQn, SYNTH_IRQn,
    HOSTMAILBOX_IRQn, RFECA0_IRQn, RFECA1_IRQn,
  };
  const uintptr_t table_address = (uintptr_t)non_legal->vector_table;
  const uintptr_t module_flash_start = 0x08100100UL;
  const uintptr_t module_flash_end = 0x08180000UL;
  const uint32_t required_entries = 16U + EXT_IRQ_COUNT;
  const uint32_t *host_vector_table = (const uint32_t *)(uintptr_t)SCB->VTOR;

  if ((table_address < module_flash_start)
      || (table_address >= module_flash_end)
      || ((table_address & 0x1ffU) != 0U)
      || (non_legal->vector_table_entries < required_entries)
      || ((table_address + (required_entries * sizeof(uint32_t))) > module_flash_end)
      || (((uintptr_t)host_vector_table & 0x1ffU) != 0U)) {
    return SL_STATUS_INVALID_PARAMETER;
  }

  uint32_t primask = __get_PRIMASK();
  __disable_irq();

  sl_status_t status = SL_STATUS_OK;
  for (uint32_t i = 0U; i < required_entries; ++i) {
    ram_vector_table[i] = host_vector_table[i];
  }

  for (size_t i = 0U; i < (sizeof(radio_irqs) / sizeof(radio_irqs[0])); ++i) {
    const IRQn_Type irqn = radio_irqs[i];
    const uintptr_t handler = (uintptr_t)non_legal->vector_table[16U + (uint32_t)irqn];
    const uintptr_t handler_address = handler & ~(uintptr_t)1U;

    if (((handler & 1U) == 0U)
        || (handler_address < module_flash_start)
        || (handler_address >= module_flash_end)) {
      status = SL_STATUS_INVALID_PARAMETER;
      break;
    }

    ram_vector_table[16U + (uint32_t)irqn] = (uint32_t)handler;
  }

  if (status == SL_STATUS_OK) {
    SCB->VTOR = (uint32_t)(uintptr_t)ram_vector_table;
    __DSB();
    __ISB();
  }

  if (primask == 0U) {
    __enable_irq();
  }
  return status;
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
         && (non_legal->radio_test != NULL)
         && (non_legal->vector_table != NULL);
}

static void non_legal_process_task(void *argument)
{
  (void)argument;

  for (;;) {
    (void)non_legal->process_action();
    non_legal_process_stack_free_bytes = osThreadGetStackSpace(osThreadGetId());
    osDelay(1000U);
  }
}

void app_init(void)
{
  static const osThreadAttr_t process_task_attributes = {
    .name = "non_legal_process",
    .stack_mem = non_legal_process_stack,
    .stack_size = sizeof(non_legal_process_stack),
    .cb_mem = &non_legal_process_tcb,
    .cb_size = sizeof(non_legal_process_tcb),
    .priority = osPriorityNormal,
  };

  if (!split_interface_is_valid()) {
    printf("split PoC: invalid module at 0x%08lx\r\n",
           (unsigned long)SPLIT_INTERFACE_ADDRESS);
    return;
  }

  sl_status_t status = install_non_legal_radio_isrs();
  if (status != SL_STATUS_OK) {
    printf("split PoC: radio ISR table install failed (0x%08lx)\r\n",
           (unsigned long)status);
    return;
  }

  status = non_legal->init();
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
