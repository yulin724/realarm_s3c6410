
@ 0x50000000 is the DDR RAM's start mapping address
@ set stack size to be 0x1000(4l)
.equ stack_top, 0x50001000

.section .text
.global _start

_start:
	ldr sp, =stack_top	@set stack
	b call_main

call_main:
	bl main
