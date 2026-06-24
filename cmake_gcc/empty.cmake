####################################################################
# Automatically-generated file. Do not edit!                       #
####################################################################

set(SDK_PATH "/Users/brrodrig/.silabs/slt/installs/conan/p/simplfa179856e7001/p")
set(COPIED_SDK_PATH "simplicity_sdk_2025.6.3")
set(PKG_PATH "/Users/brrodrig/.silabs/slt/installs")

add_library(slc OBJECT
    "../${COPIED_SDK_PATH}/hardware/board/src/sl_board_control_gpio.c"
    "../${COPIED_SDK_PATH}/hardware/board/src/sl_board_init.c"
    "../${COPIED_SDK_PATH}/hardware/driver/configuration_over_swo/src/sl_cos.c"
    "../${COPIED_SDK_PATH}/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_eusart/sl_mx25_flash_shutdown.c"
    "../${COPIED_SDK_PATH}/platform/bootloader/api/btl_interface.c"
    "../${COPIED_SDK_PATH}/platform/bootloader/api/btl_interface_storage.c"
    "../${COPIED_SDK_PATH}/platform/bootloader/app_properties/app_properties.c"
    "../${COPIED_SDK_PATH}/platform/bootloader/core/flash/btl_internal_flash.c"
    "../${COPIED_SDK_PATH}/platform/CMSIS/RTOS2/Source/os_systick.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_assert.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_cmsis_os2_common.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_core_cortexm.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_slist.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_string.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_syscalls.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sli_cmsis_os2_ext_task_register.c"
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG24/Source/startup_efr32mg24.c"
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG24/Source/system_efr32mg24.c"
    "../${COPIED_SDK_PATH}/platform/driver/debug/src/sl_debug_swo.c"
    "../${COPIED_SDK_PATH}/platform/driver/gpio/src/sl_gpio.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/dmadrv/src/dmadrv.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/src/nvm3.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/src/nvm3_cache.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/src/nvm3_default_common_linker.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/src/nvm3_hal_flash.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/src/nvm3_lock.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/src/nvm3_object.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/src/nvm3_page.c"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/src/nvm3_utils.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_cmu.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_emu.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_eusart.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_gpio.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_ldma.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_msc.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_system.c"
    "../${COPIED_SDK_PATH}/platform/peripheral/src/sl_hal_eusart.c"
    "../${COPIED_SDK_PATH}/platform/peripheral/src/sl_hal_gpio.c"
    "../${COPIED_SDK_PATH}/platform/peripheral/src/sl_hal_prs.c"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager.c"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_init.c"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_dcdc_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_emu_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.c"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.c"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/src/sl_device_clock.c"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/src/sl_device_gpio.c"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/src/sl_device_peripheral.c"
    "../${COPIED_SDK_PATH}/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c"
    "../${COPIED_SDK_PATH}/platform/service/iostream/src/sl_iostream.c"
    "../${COPIED_SDK_PATH}/platform/service/iostream/src/sl_iostream_eusart.c"
    "../${COPIED_SDK_PATH}/platform/service/iostream/src/sl_iostream_retarget_stdio.c"
    "../${COPIED_SDK_PATH}/platform/service/iostream/src/sl_iostream_uart.c"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager.c"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager_dynamic_reservation.c"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager_pool.c"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager_pool_common.c"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager_region.c"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager_retarget.c"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src/sli_memory_manager_common.c"
    "../${COPIED_SDK_PATH}/platform/service/sl_main/src/rtos/main_retarget.c"
    "../${COPIED_SDK_PATH}/platform/service/sl_main/src/sl_main_init.c"
    "../${COPIED_SDK_PATH}/platform/service/sl_main/src/sl_main_init_memory.c"
    "../${COPIED_SDK_PATH}/platform/service/sl_main/src/sl_main_kernel.c"
    "../${COPIED_SDK_PATH}/platform/service/udelay/src/sl_udelay.c"
    "../${COPIED_SDK_PATH}/platform/service/udelay/src/sl_udelay_armv6m_gcc.S"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/cmsis/Source/cmsis_os2.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/croutine.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/event_groups.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/list.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/mpu_wrappers_v2_asm.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/port.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure/portasm.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/portable/MemMang/heap_3.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/queue.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/stream_buffer.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/tasks.c"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/timers.c"
    "../app.c"
    "../autogen/sl_board_default_init.c"
    "../autogen/sl_event_handler.c"
    "../autogen/sl_iostream_handles.c"
    "../autogen/sl_iostream_init_eusart_instances.c"
    "../main.c"
)

target_include_directories(slc PUBLIC
   "../config"
   "../autogen"
   "../."
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG24/Include"
    "../${COPIED_SDK_PATH}/platform/common/inc"
    "../${COPIED_SDK_PATH}/hardware/board/inc"
    "../${COPIED_SDK_PATH}/platform/bootloader"
    "../${COPIED_SDK_PATH}/platform/bootloader/api"
    "../${COPIED_SDK_PATH}/platform/bootloader/core/flash"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/inc"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src"
    "../${COPIED_SDK_PATH}/platform/CMSIS/Core/Include"
    "../${COPIED_SDK_PATH}/platform/CMSIS/RTOS2/Include"
    "../${COPIED_SDK_PATH}/hardware/driver/configuration_over_swo/inc"
    "../${COPIED_SDK_PATH}/platform/driver/debug/inc"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/inc"
    "../${COPIED_SDK_PATH}/platform/service/device_init/inc"
    "../${COPIED_SDK_PATH}/platform/emdrv/dmadrv/inc"
    "../${COPIED_SDK_PATH}/platform/emdrv/dmadrv/inc/s2_signals"
    "../${COPIED_SDK_PATH}/platform/emdrv/common/inc"
    "../${COPIED_SDK_PATH}/platform/emlib/inc"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/include"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/cmsis/Include"
    "../${COPIED_SDK_PATH}/util/third_party/freertos/kernel/portable/GCC/ARM_CM33_NTZ/non_secure"
    "../${COPIED_SDK_PATH}/platform/driver/gpio/inc"
    "../${COPIED_SDK_PATH}/platform/peripheral/inc"
    "../${COPIED_SDK_PATH}/platform/service/interrupt_manager/inc"
    "../${COPIED_SDK_PATH}/platform/service/interrupt_manager/src"
    "../${COPIED_SDK_PATH}/platform/service/interrupt_manager/inc/arm"
    "../${COPIED_SDK_PATH}/platform/service/iostream/inc"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/inc"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src"
    "../${COPIED_SDK_PATH}/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_eusart"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/inc"
    "../${COPIED_SDK_PATH}/platform/emdrv/nvm3/config"
    "../${COPIED_SDK_PATH}/platform/service/sl_main/inc"
    "../${COPIED_SDK_PATH}/platform/service/sl_main/src"
    "../${COPIED_SDK_PATH}/platform/service/udelay/inc"
)

target_compile_definitions(slc PUBLIC
    "DEBUG_EFM=1"
    "EFR32MG24B210F1536IM48=1"
    "SL_CODE_COMPONENT_SYSTEM=system"
    "SL_APP_PROPERTIES=1"
    "SL_BOARD_NAME=\"BRD4186C\""
    "SL_BOARD_REV=\"A01\""
    "HARDWARE_BOARD_DEFAULT_RF_BAND_2400=1"
    "HARDWARE_BOARD_SUPPORTS_1_RF_BAND=1"
    "HARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1"
    "HFXO_FREQ=39000000"
    "SL_CODE_COMPONENT_CLOCK_MANAGER=clock_manager"
    "configNUM_SDK_THREAD_LOCAL_STORAGE_POINTERS=2"
    "SL_COMPONENT_CATALOG_PRESENT=1"
    "SL_CODE_COMPONENT_DEVICE_PERIPHERAL=device_peripheral"
    "SL_CODE_COMPONENT_DMADRV=dmadrv"
    "SL_CODE_COMPONENT_FREERTOS_KERNEL=freertos_kernel"
    "SL_CODE_COMPONENT_GPIO=gpio"
    "SL_CODE_COMPONENT_HAL_COMMON=hal_common"
    "SL_CODE_COMPONENT_HAL_GPIO=hal_gpio"
    "SL_CODE_COMPONENT_INTERRUPT_MANAGER=interrupt_manager"
    "CMSIS_NVIC_VIRTUAL=1"
    "CMSIS_NVIC_VIRTUAL_HEADER_FILE=\"cmsis_nvic_virtual.h\""
    "SL_CODE_COMPONENT_CORE=core"
)

target_link_libraries(slc PUBLIC
    "-Wl,--start-group"
    "gcc"
    "c"
    "m"
    "nosys"
    "-Wl,--end-group"
)
target_compile_options(slc PUBLIC
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:C>:-mthumb>
    $<$<COMPILE_LANGUAGE:C>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:C>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:C>:-mcmse>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-Os>
    $<$<COMPILE_LANGUAGE:C>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:C>:-fomit-frame-pointer>
    $<$<COMPILE_LANGUAGE:C>:-g>
    $<$<COMPILE_LANGUAGE:C>:-fno-lto>
    $<$<COMPILE_LANGUAGE:C>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:CXX>:-mthumb>
    $<$<COMPILE_LANGUAGE:CXX>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:CXX>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-mcmse>
    $<$<COMPILE_LANGUAGE:CXX>:-Wall>
    $<$<COMPILE_LANGUAGE:CXX>:-Wextra>
    $<$<COMPILE_LANGUAGE:CXX>:-Os>
    $<$<COMPILE_LANGUAGE:CXX>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-fomit-frame-pointer>
    $<$<COMPILE_LANGUAGE:CXX>:-g>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-lto>
    $<$<COMPILE_LANGUAGE:CXX>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:ASM>:-mthumb>
    $<$<COMPILE_LANGUAGE:ASM>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:ASM>:-mfloat-abi=hard>
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-x assembler-with-cpp>"
)

set(post_build_command )
set_property(TARGET slc PROPERTY C_STANDARD 17)
set_property(TARGET slc PROPERTY CXX_STANDARD 17)
set_property(TARGET slc PROPERTY CXX_EXTENSIONS OFF)

target_link_options(slc INTERFACE
    -mcpu=cortex-m33
    -mthumb
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -T${CMAKE_CURRENT_LIST_DIR}/../autogen/linkerfile.ld
    --specs=nano.specs
    "SHELL:-Xlinker -Map=$<TARGET_FILE_DIR:empty>/empty.map"
    "SHELL:-Wl,--wrap=_free_r -Wl,--wrap=_malloc_r -Wl,--wrap=_calloc_r -Wl,--wrap=_realloc_r"
    -Wl,--wrap=main
    -fno-lto
    -Wl,--gc-sections
)

# BEGIN_SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA