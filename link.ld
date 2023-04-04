OUTPUT_ARCH( "riscv" )
ENTRY(_start)



SECTIONS
{
  . = 0x80000000;
  .text : ALIGN(0x100) { *(.text) }
  . = 0x80001000;
  .data : ALIGN(0x100) { *(.data) }
  .tohost : ALIGN(0x100) { *(.tohost) }
  .bss : ALIGN(0x100) { *(.bss) }
  _end = .;
}
