################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.c 

OBJS += \
./Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.o 

C_DEPS += \
./Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.o: ../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Inc" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Drivers/CMSIS/Include" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Middlewares/ST/STM32_USB_Device_Library/Core/Inc" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc"  -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


