####################################################################
# Automatically-generated file. Do not edit!                       #
####################################################################

set(SDK_PATH "/Users/brian/.silabs/slt/installs/conan/p/simplfa179856e7001/p")
set(COPIED_SDK_PATH "simplicity_sdk_2025.6.3")
set(PKG_PATH "/Users/brian/.silabs/slt/installs")

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

# BEGIN_SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA