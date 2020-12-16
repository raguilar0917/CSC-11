.equ LOW, 0
.equ HIGH, 1
.equ OUTPUT, 1
.equ INPUT, 0

.section .rodata
print:	.asciz "%u\n"

.global goLight
.global blink_start
.section .text
blink_start:
	push {lr}
	mov r4, #0
	//mov r2, r1
blink_loop:

	cmp r4, #10 //compares r4 and r1
	bgt blink_loop_end //if (r4 > r1) branch to end
	
	mov r0, #23	
	mov r1, #LOW
	bl digitalWrite
	

	
	mov r0, #100 // saves 100 in r0 and delays a second
	bl delay

	mov r0, #23
	mov r1, #HIGH
	bl digitalWrite


	mov r0, #100
	bl delay

	add r4, #1
	b blink_loop
	
blink_loop_end:

	//b blink_start
	mov r4, #0
	pop {pc}

	

goLight:
	push {lr}
	
	pop {r0}
	bl blink_start

	//mov r6, r0
	push {r0}

	mov r0, #1000
	bl delay

	pop {r0}
	bl blink_start
	
	mov r0, r6
	mov r1, #LOW
	pop {pc}
