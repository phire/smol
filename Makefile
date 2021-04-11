
all: smol-stripped

smol: main.cpp Makefile linker.lds
	gcc main.cpp -o smol -flto -Os -Wall -fno-unroll-loops -nostartfiles  -ffreestanding -Wl,-T,linker.lds -ldl


smol-stripped: smol
	strip -R .note -R .comment -R .eh_frame -R .eh_frame_hdr -R .note.gnu.property -R .note.gnu.build-id -R .gnu.hash -s smol -o smol-stripped

