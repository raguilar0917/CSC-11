.global main
.section .rodata

prompt:	.asciz "Enter integers with a space between each: "
scan:	.asciz "%u %u %u"
output:	.asciz "%d + %d + %d = "
result: .asciz "%d"
.data
x:	.word 0
y:	.word 0
z:	.word 0

.text
main:	push {lr}

	//print prompt
	ldr r0, =prompt
	bl printf

	//input
	ldr r0, =scan
	ldr r1, =x
	ldr r2, =y
	ldr r3, =z
	bl scanf

	//load data in variable into registers
	ldr r0, =x
	ldr r1, =y
	ldr r2, =z
	ldr r5, [r0]
	ldr r6, [r1]
	ldr r7, [r2]

	//addition
	add r4, r5, r6
	add r4, r4, r7

	//output
	ldr r0, =output
	mov r1, r5
	mov r2, r6
	mov r3, r7
	bl printf
	
	ldr r0, =result
	mov r1, r4
	bl printf
	
	mov r0, #0
	pop {pc}
	
