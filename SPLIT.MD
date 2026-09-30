# `empty` / `empty_non_legal` split PoC

This PoC makes `empty_non_legal` a fixed-address module that `empty` calls.
It deliberately does not use TrustZone: both images run in the same security
state and normal ARM function pointers cross the image boundary.

## Flash and RAM layout

```text
0x08000000 - 0x08006000  bootloader
0x08006000 - 0x08100000  empty (host / legal application)
0x08100000 - 0x08180000  empty_non_legal (module)

0x20000004 - 0x20030000  empty RAM
0x20030000 - 0x20040000  empty_non_legal RAM
```

The bootloader storage slot is limited to `0x080A0000 - 0x080F6000`.
Legal NVM3 occupies the next five 8 KiB pages:
`0x080F6000 - 0x08100000`. The non-legal image starts immediately afterwards.

## ABI

`split_interface_t` is defined in `split_interface.h`. Its descriptor is at
the fixed address `0x08100000`. The non-legal FLASH region starts at
`0x08100100`, after the 256-byte descriptor region; the vector table is aligned
by the linker (currently `0x08100200`).

ABI version 2 contains:

- `init()` — called once by `empty` from `app_init()`.
- `process_action()` — called every second from a host FreeRTOS task.
- `ccm_encrypt()` / `ccm_decrypt()` — synchronous AES-128 CCM through RADIOAES.
- `radio_test()` — Green Power known-answer and bad-tag tests in the module.

Before calling any function, the host validates the descriptor magic, ABI
version, size, and that all function pointers are present. This is enough
validation for a fixed-image proof of concept. A field-updatable RAIL module will need image
authentication, a compatibility policy, and an update/install strategy.

## Linker placement

`split_interface.h` defines `SPLIT_INTERFACE_ADDRESS`. The non-legal linker
reserves `MAGIC_region` at `0x08100000` (size `0x100`) and keeps
`.split_interface` there. Its FLASH region starts at `0x08100100`.
These linker scripts contain manual memory-layout changes; preserve them when
regenerating either project.

The module retains its ordinary startup/vector code so it can still be built
and flashed independently. The host must *not* call the module's
`Reset_Handler` or `main()`; it calls only the descriptor functions. Before
adding RAIL, remove unused startup and platform ownership from
`empty_non_legal` so `empty` remains the owner of clocking, FreeRTOS,
interrupts, and board initialization.

## Running the PoC

1. Build `empty_non_legal` and flash it at `0x08100000`.
2. Build `empty` and flash it at `0x08006000`, alongside the bootloader.
3. On VCOM, `empty` reports initialization. Use the crypto CLI below.

The module must be programmed before the host image is allowed to invoke it.
If the descriptor is erased or incompatible, the host logs the error and does
not create the periodic task.

## RADIOAES CCM and CLI

Regenerate **both** `.slcp` projects in Simplicity Studio before building. The
non-legal project now selects `sli_protocol_crypto`; the legal project selects
`cli` (instance `vcom`), `psa_crypto_aes` and `psa_crypto_cipher_ecb`. Generation must update copied
SDK sources, generated component headers, CLI configuration and CMake inputs.
Keep the existing linker scripts' split flash/RAM and bootloader/NVM3 layout;
compare regenerated scripts against Git before building. Rebuild and flash both
images together because the descriptor is now ABI v2.

The host initializes the module once before exposing the CLI. That entry point
copies the module's data/RAM code and clears its BSS, since its reset handler is
never run. It initializes protocol crypto and seeds RADIOAES masking before the
legal SE workload starts. The SDK uses SE entropy for this initial mask seed;
subsequent CCM operations use RADIOAES. Do not add another RTOS to the module.
The host heap is 16 KiB to accommodate the CLI, worker and existing tasks.

Commands on the default VCOM CLI:

- `radio_test`: checks Green Power level 3 encryption (ciphertext `83`, MIC
  `0f988fc2`), in-place decryption, rejection/clearing after a corrupted MIC,
  and level 2 authentication-only (MIC `0fc0b079`). Prints PASS or a status.
- `se_test`: checks the FIPS-197 AES-128 example using PSA Crypto (SE accelerated on EFR32MG24). The command name is
  retained for compatibility. Each test imports a volatile AES key, encrypts
  one block with `PSA_ALG_ECB_NO_PADDING`, checks it and destroys the key.
- `crypto_parallel`: runs 1000 module tests in a worker while the CLI task runs
  1000 PSA AES tests. Both loops yield one RTOS tick per iteration. Success is
  `RADIOAES 1000/1000 (0x00000000), PSA 1000/1000 (status 0)`.
  This exercises concurrent tasks using separate accelerators; it does not
  measure or guarantee simultaneous hardware execution.

The CLI serializes its commands. Other callers must serialize module CCM/test
calls too: the non-legal SDK is built without an RTOS mutex. SE calls may run
concurrently after module initialization. The APIs accept a 16-byte key, a
13-byte nonce, AAD, separate/in-place payload buffers and an even tag length
from 4 through 16. Each payload/AAD length is limited to 127 bytes; the SDK
Zigbee helper encodes lengths for small frames. Decrypt returns
`SL_STATUS_INVALID_SIGNATURE` on a bad tag and clears the output on crypto
failure. See `split_interface.h` for buffer requirements.

Fixed key/nonce macros in `radio_ccm.c` are for repeatable tests only. In an
application, supply a fresh nonce for each encryption under the same key.
The vectors come from [Green Power 095499r26, A.1.5.5.3 and A.1.5.5.4](https://csa-iot.org/wp-content/uploads/2022/01/docs-09-5499-26-batt-zigbee-green-power-specification-1.pdf).
For level 3, use the transmitted packet on page 52; the worked calculation on
page 53 includes an extra payload byte in AAD and has a different MIC.
The CLI registration follows the [reference PoC](https://github.com/brian-silabs/cnct_mac_crypto/tree/main/crypto_poc).
