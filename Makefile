CC=gcc
TARGET=myos
C_FILES=./libc/string/ctos.c \
		./libc/string/memcmp.c \
		./libc/string/memset.c \
		./libc/string/strcat.c \
		./libc/string/strchr.c \
		./libc/string/strcmp.c \
		./libc/string/strcpy.c \
		./libc/string/strlen.c \
		./libc/string/strncmp.c \
		./libc/string/strstr.c \
		./libc/string/strutil.c \
		./kernel/tty.c \
		./kernel/io.c \
		./kernel.c 
OBJS=$(C_FILES:.c=.o)

all compile: $(TARGET)
all: finale
.PHONY: all compile clean finale

%.o:
	$(CC) -c $(@:.o=.c) -o $@ -ffreestanding -fno-exceptions -m32

$(TARGET): $(OBJS)
	$(shell nasm -f elf start.asm -o start.o)
	$(CC) -m32 -nostdlib -nodefaultlibs -lgcc start.o $? -T linker.ld -o $(TARGET)

finale:
	$(shell cp $(TARGET) ./iso/boot/$(TARGET))
	$(shell grub2-mkrescue iso --output=$(TARGET).iso)

clean:
	rm -f *.o $(TARGET) $(TARGET).iso
	find . -name \*.o | xargs --no-run-if-empty rm


# all: 
# 	gcc -c kernel.c -o kernel.o -ffreestanding -fno-exceptions -m32
# 	$(shell nasm -f elf32 start.asm -o start.o)
#   gcc -m32 -nostdlib -nodefaultlibs -lgcc start.o libc/string/ctos.o libc/string/memcmp.o libc/string/memset.o libc/string/strcat.o libc/string/strchr.o libc/string/strcmp.o libc/string/strcpy.o libc/string/strlen.o libc/string/strncmp.o libc/string/strstr.o libc/string/strutil.o kernel/tty.o kernel.o -T linker.ld -o myos
# 	$(shell mv myos ./iso/boot/myos)

# image:
# 	$(shell grub2-mkrescue iso --output=myos.iso)

# clean:
# 	rm -f start.o kernel.o myos.iso
# 	rm -f ./iso/boot/myos
