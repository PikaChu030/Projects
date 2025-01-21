OUTPUT_ARCH( "riscv" )

SECTIONS
{
    . = 0x0000;
    .text : { *(.text) }

    . = 0xfff0;
    _stack = .;

    . = 0xfffc;
    _sim_end = .;
}