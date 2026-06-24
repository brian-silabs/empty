/**
 * @file split_interface.h
 * @brief Fixed-address ABI between empty and empty_non_legal.
 *
 * This interface is intentionally small. It is a same-security-state,
 * fixed-address function table, not an ELF dynamic loader interface.
 */

#ifndef SPLIT_INTERFACE_H
#define SPLIT_INTERFACE_H

#include <stdint.h>

#define SPLIT_INTERFACE_ADDRESS (0x08100000UL)
#define SPLIT_INTERFACE_MAGIC (0x53504C54UL) /* "SPLT" */
#define SPLIT_INTERFACE_ABI_VERSION (1U)

typedef void (*split_init_fn_t)(void);
typedef uint32_t (*split_process_action_fn_t)(void);

typedef struct {
  uint32_t magic;
  uint16_t abi_version;
  uint16_t size;
  split_init_fn_t init;
  split_process_action_fn_t process_action;
} split_interface_t;

#endif // SPLIT_INTERFACE_H
