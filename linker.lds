ENTRY(_start)

PHDRS {
    headers PT_PHDR PHDRS ;
    interp PT_INTERP;
    text PT_LOAD FILEHDR PHDRS AT (0x10000) FLAGS(7);
    dynamic PT_DYNAMIC;
}

SECTIONS {
    . = 0x10000 + SIZEOF_HEADERS;
    .dynamic :  { *(.dynamic) } :text :dynamic
    .interp : { *(.interp) } :text :interp
    .text : {
        * (.text);
        * (.rodata);
    } : text

    /DISCARD/ : {
        *(.note.gnu.property)
        *(.note.gnu.build-id)
        *(.eh_frame)
        *(.comment)
    }
}