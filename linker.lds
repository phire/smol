ENTRY(_start)

PHDRS {
    x PT_LOAD FILEHDR PHDRS AT (0x10000);
}

SECTIONS {
    . = 0x10000 + SIZEOF_HEADERS;
    .text : {
        * (.text);
        * (.rodata);
    } : x

    /DISCARD/ : {
        *(.note.gnu.property)
        *(.note.gnu.build-id)
        *(.eh_frame)
        *(.comment)
    }
}