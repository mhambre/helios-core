ENTRY(_start) /* Entrypoint symbol defined in main.rs */

OUTPUT_FORMAT("elf32-i386")
OUTPUT_ARCH(i386)

SECTIONS
{
    . = 1M; /* Load address for the kernel (1 MiB) */

    .multiboot ALIGN(4K) : {
        KEEP(*(.multiboot))
    }

    .text ALIGN(4K) : {
        *(.text._start)
        *(.text*)
    }

    .rodata ALIGN(4K) : {
        *(.rodata*)
    }

    .data ALIGN(4K) : {
        *(.data*)
    }

    .bss ALIGN(4K) : {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    }
}
