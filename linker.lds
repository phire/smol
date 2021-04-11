ENTRY(_start)

PHDRS {
    headers PT_PHDR PHDRS ;
    interp PT_INTERP;
    text PT_LOAD FILEHDR PHDRS AT (0x10000);
    data PT_LOAD ;
    dynamic PT_DYNAMIC;
}

SECTIONS {
    . = 0x10000 + SIZEOF_HEADERS;
    .interp : { *(.interp) } :text :interp
    .text : {
        * (.text);
        * (.rodata);
    } : text

    . = . + 0x1000;

    .data : { *(.data) } :data
    .dynamic : ALIGN(0x1000) { *(.dynamic) } :data :dynamic

    /DISCARD/ : {
        *(.note.gnu.property)
        *(.note.gnu.build-id)
        *(.eh_frame)
        *(.comment)
    }
}