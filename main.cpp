

void write(const char* buffer, int size) {
    asm("syscall"
        :
        : "D" (1), // fd
          "a" (1), // SYS_write
          "S" (buffer),
          "d" (size)
        : "memory"
        );
}

void exit(int code) {
    asm("syscall"
        :
        : "a" (60), // SYS_exit
          "D" (code) // code
        : "memory"
        );
}

constexpr const char string[] = "Hello World!\n";

extern "C" {

void _start() {
    write(string, sizeof(string));
    exit(0);
}

}