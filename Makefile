
all: smol-stripped

smol: main.cpp Makefile linker.lds
	gcc -static main.cpp -o smol -flto -Os -Wall -fno-unroll-loops -nostartfiles -nostdlib -Wl,-T,linker.lds -Wl,-N


smol-stripped: smol
	strip -R .note -R .comment -R .eh_frame -R .eh_frame_hdr -R .note.gnu.property -R .note.gnu.build-id -R .gnu.hash -R .dynamic -R .dynstr -R .dynsym -R .interp -s smol -o smol-stripped

