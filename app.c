/***************************************************************************//**
 * @file
 * @brief Host side of the fixed-address split PoC.
 ******************************************************************************/

#include "cmsis_os2.h"
#include "split_interface.h"

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
         && (non_legal->process_action != NULL);
}

static void non_legal_process_task(void *argument)
{
  (void)argument;

  for (;;) {
    printf("split PoC: process_action=%lu\r\n",
           (unsigned long)non_legal->process_action());
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

  non_legal->init();
  printf("split PoC: module initialized\r\n");

  if (osThreadNew(non_legal_process_task, NULL, &process_task_attributes) == NULL) {
    printf("split PoC: process task creation failed\r\n");
  }
}

void app_process_action(void)
{
}
