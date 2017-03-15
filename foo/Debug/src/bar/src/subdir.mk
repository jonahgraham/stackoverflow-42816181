################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/tmp/so/git/bar/src/source.c \
/tmp/so/git/bar/src/source2.c 

OBJS += \
./src/bar/src/source.o \
./src/bar/src/source2.o 

C_DEPS += \
./src/bar/src/source.d \
./src/bar/src/source2.d 


# Each subdirectory must supply rules for building sources it contributes
src/bar/src/source.o: /tmp/so/git/bar/src/source.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -I"/tmp/so/git/bar/inc" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/bar/src/source2.o: /tmp/so/git/bar/src/source2.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -I"/tmp/so/git/bar/inc" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


