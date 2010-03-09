

#
# Tools
#
CROSS_COMPILE :=arm-none-linux-gnueabi-

CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)ld
OBJCOPY := $(CROSS_COMPILE)objcopy

#
# Options
#
CFLAGS := -Wall -Wstrict-prototypes -O0 -fomit-frame-pointer -ffreestanding
LDFLAGS := -Ttext 0x00000000 -Bstatic

#
# Objects
#
OBJS := $(patsubst %.s, %.o, $(wildcard ./*.s))
OBJS += $(patsubst %.c, %.o, $(wildcard ./*.c))

all: led

led: $(OBJS)
	$(LD) $(LDFLAGS) $^ -o tmp.o
	$(OBJCOPY) -O binary -S tmp.o $@

clean:
	find . -name "*.o" -exec rm {} \;
	$(RM) led

%.o: %.s
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
