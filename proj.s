.equ LOW, 0
.equ HIGH, 1
.equ OUTPUT, 1
.equ INPUT, 0

.equ RED_LED, 16
.equ GREEN_LED, 21
.equ YELLOW_LED, 20

.equ RED_LED_STOP_ONE, 24
.equ GREEN_LED_STOP_ONE, 23
.equ BUTTON_ONE, 18

.equ RED_LED_STOP_TWO, 12
.equ GREEN_LED_STOP_TWO, 25
.equ BUTTON_TWO, 17

.section .rodata
val: 	.word 2000
print:	.asciz "%u\n"

.global goLight
.global blink_start
.global cross
.section .text
blink_start:
	//savese r4. r6, r7
	push {r4, r6, r7, lr}
	mov r4, #0 // int r4 = 0
	mov r6, r0 // r6 = to value 
	mov r7, r1 // r7 = r1
	
blink_loop:

	cmp r4, #10 //compares r4 and r1
	bgt blink_loop_end //if (r4 > r1) branch to end
	
	//turns off led
	mov r0, r6
	mov r1, #LOW
	bl digitalWrite

	//turns off second led
	mov r0, r7	
	mov r1, #LOW
	bl digitalWrite
	
	//delays for 200
	mov r0, #200
	bl delay

	//turns on LED
	mov r0, r7	
	mov r1, #HIGH
	bl digitalWrite
	//turns off second led
	mov r0, r6
	mov r1, #HIGH
	bl digitalWrite	
	// delays 100
	mov r0, #100
	bl delay

	add r4, #1 //r4++
	b blink_loop
	
blink_loop_end:

	mov r4, #0
	pop {r4, r6, r7, pc}

	

cross:
	push {lr}
	//saves values in r1 and r0 to r6 and r7 for later use
	mov r7, r1
	mov r6, r0

	//turns on the yellow LED
	mov r0, #YELLOW_LED
	mov r1, #HIGH
	bl digitalWrite

	//BLINKS THE CORRESPONDING LED WHILE YELLOW LED IS ON
	mov r1, #0
	mov r0, r6
	bl blink_start//Links to blink loop
	
	mov r0, #GREEN_LED_STOP_ONE
	mov r1, #HIGH
	bl digitalWrite

	//when button is pressed both green one and two are on
	mov r0, #GREEN_LED_STOP_TWO
	mov r1, #HIGH
	bl digitalWrite


	//once button is pressed both one and two are off		
	mov r0, #RED_LED_STOP_ONE
	mov r1, #LOW
	bl digitalWrite	

	mov r0, #RED_LED_STOP_TWO
	mov r1, #LOW
	bl digitalWrite	

	//turns off the go light
	mov r0, #GREEN_LED
	mov r1, #LOW
	bl digitalWrite

	
	mov r0, #RED_LED
	mov r1, #HIGH
	bl digitalWrite

	//gets the value 2000 and puts it in r0
	ldr r0, =val
	ldr r0, [r0]
	bl delay
	
	ldr r0, =val
	ldr r0, [r0]
	bl delay

	//turns on yield light
	mov r0, #YELLOW_LED
	mov r1, #HIGH
	bl digitalWrite

	//yield lights start blinking
	mov r0, #YELLOW_LED
	bl blink_start
	
	//turns off yellow
	mov r0, #YELLOW_LED
	mov r1, #LOW
	bl digitalWrite

	mov r0, #GREEN_LED_STOP_ONE
	mov r1, #LOW
	bl digitalWrite

	mov r0, #GREEN_LED_STOP_TWO
	mov r1, #LOW
	bl digitalWrite

	mov r0, #RED_LED
	mov r1, #HIGH
	bl digitalWrite

	ldr r0, =val
	ldr r0, [r0]
	bl delay

	mov r0, #RED_LED
	mov r1, #LOW
	bl digitalWrite

	mov r0, #GREEN_LED_STOP_ONE
	mov r1, #LOW
	bl digitalWrite
	

	mov r0, #GREEN_LED_STOP_TWO
	mov r1, #LOW
	bl digitalWrite		

	pop {pc}
	
	
