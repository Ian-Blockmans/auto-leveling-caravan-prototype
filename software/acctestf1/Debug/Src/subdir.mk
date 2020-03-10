################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/main.c \
../Src/stm32f1xx_hal_msp.c \
../Src/stm32f1xx_it.c \
../Src/syscalls.c \
../Src/system_stm32f1xx.c \
../Src/u8g2_stm32f0.c 

OBJS += \
./Src/main.o \
./Src/stm32f1xx_hal_msp.o \
./Src/stm32f1xx_it.o \
./Src/syscalls.o \
./Src/system_stm32f1xx.o \
./Src/u8g2_stm32f0.o 

C_DEPS += \
./Src/main.d \
./Src/stm32f1xx_hal_msp.d \
./Src/stm32f1xx_it.d \
./Src/syscalls.d \
./Src/system_stm32f1xx.d \
./Src/u8g2_stm32f0.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -DUSE_HAL_DRIVER -DSTM32F103xB -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Inc" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Middlewares/u8g2" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Drivers/STM32F1xx_HAL_Driver/Inc" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Drivers/CMSIS/Device/ST/STM32F1xx/Include" -I"D:/Users/Ian/Documents/GitHub/PE2/software/acctestf1/Drivers/CMSIS/Include"  -O3 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


