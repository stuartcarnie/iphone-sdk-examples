/*
 * process.s
 * ARM-Parallel-Assembly
 *
 * Created by Stuart Carnie on 11/26/08.
 * Copyright 2008 __MyCompanyName__. All rights reserved.
 */

.set device, 0
.set device, __arm__

.if device

.globl _process_image
.code 32

_process_image:
	stmfd	sp!, {r4-r6, lr}
	
	ldr		r6, VAL
	mov		r1, r1, lsr #4			@ divide by 8, since we're working with 4 x 1 RGBA pixel = 16 bytes per iteration

.align 4
	
loop:
	ldmia	r0, {r2-r5}
	uqadd8	r2, r2, r6
	uqadd8	r3, r3, r6
	uqadd8	r4, r4, r6
	uqadd8	r5, r5, r6
	stmia	r0!, {r2-r5}
	subs	r1, r1, #1
	bne		loop
	
	ldmfd	sp!, {r4-r6, pc}		@ return	

VAL:
	.long 0x01010100
.endif