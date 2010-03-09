.equ GPNCON, 0x7F008830
.equ GPNDAT, 0x7F008834

.section .text

.global _start

_start:
	ldr     r0,=GPNCON			@load GPNCON(a memory address value) into r0
	ldr	r1,[r0]
	bic	r1,#0x1000
	orr	r1,r1,#0x1000
	str     r1,[r0]

	ldr     r0,=GPNDAT			@GPNDAT
	ldr     r1,[r0]
	orr	r2,r1,#0x40			@dark, r1|0b1000000
	and	r3,r1,#0x3F			@light,r1&0b0111111

dark:
	str	r2,[r0]				@dark led
	ldr	r4,=1000000
delay:
	sub	r4,r4,#1
	cmp	r4,#0
	bne	delay
light:
	str	r3,[r0]				@light led
	ldr	r4,=1000000
delay_again:
	sub	r4,r4,#1
	cmp	r4,#0
	bne	delay_again
	b	dark


