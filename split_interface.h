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
#include <stddef.h>
#include "sl_status.h"

#define SPLIT_INTERFACE_ADDRESS (0x08100000UL)
#define SPLIT_INTERFACE_MAGIC (0x53504C54UL) /* "SPLT" */
#define SPLIT_INTERFACE_ABI_VERSION (2U)

/* Call init once, before starting callers. All module calls are synchronous.
 * Serialize CCM/test calls in the host; the module has no RTOS of its own. */
typedef sl_status_t (*split_init_fn_t)(void);

#define SPLIT_CCM_KEY_SIZE 16U
#define SPLIT_CCM_IV_SIZE 13U
#define SPLIT_CCM_MAX_LENGTH 127U

/* Payload in/out may be identical or disjoint. Other buffers must not overlap.
 * key: 16 bytes; iv: 13 bytes; tag: even length 4..16 bytes.
 * Payload and AAD lengths are each limited to 127 bytes (Zigbee frames).
 * NULL data/AAD is allowed only for zero length. Output capacity >= length.
 * Decrypt wipes the output on crypto failure; tag is input for decrypt.
 * Never reuse a key/nonce pair for encryption outside the fixed test vectors. */
typedef sl_status_t (*split_ccm_fn_t)(const uint8_t *data_in, uint8_t *data_out,
                                     size_t length, const uint8_t *key,
                                     const uint8_t *iv, const uint8_t *aad,
                                     size_t aad_len, uint8_t *tag, size_t tag_len);
typedef sl_status_t (*split_radio_test_fn_t)(void);
typedef uint32_t (*split_process_action_fn_t)(void);

typedef struct {
  uint32_t magic;
  uint16_t abi_version;
  uint16_t size;
  split_init_fn_t init;
  split_process_action_fn_t process_action;
  split_ccm_fn_t ccm_encrypt;
  split_ccm_fn_t ccm_decrypt;
  split_radio_test_fn_t radio_test;
} split_interface_t;

#endif // SPLIT_INTERFACE_H
