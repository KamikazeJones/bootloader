all: bootloader

bootloader: bootloader.s
	as -o bootloader.o bootloader.s
	ld --oformat binary -Ttext 7c00 -Tdata 7c50 -o ../bin/bootloader bootloader.o
	rm bootloader.o
