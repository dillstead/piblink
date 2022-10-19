CC = $(TOOLCHAIN)-gcc
OBJDUMP = $(TOOLCHAIN)-objdump
OBJCOPY = $(TOOLCHAIN)-objcopy
CFLAGS = -mcpu=cortex-a7 -ffreestanding -g -Wall -Wextra -Wno-unused-value -mgeneral-regs-only
LDFLAGS = -nostdlib -nostartfiles -lgcc
SRCS = $(wildcard *.S)
OBJS = $(patsubst %.S, %.o, $(SRCS))
IMG_NAME=kernel7

all:  blink

blink: $(OBJS)
	$(CC) -T linker.ld -o $(IMG_NAME).elf $(OBJS) $(LDFLAGS)
	$(OBJCOPY) $(IMG_NAME).elf -O binary $(IMG_NAME).img
	$(OBJCOPY) $(IMG_NAME).elf -O ihex $(IMG_NAME).hex
	$(OBJDUMP) -d -S $(IMG_NAME).elf > $(IMG_NAME).asm

%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm *.img *.elf *.asm *.hex *.o 


