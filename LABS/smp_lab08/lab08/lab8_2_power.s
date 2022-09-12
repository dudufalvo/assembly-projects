.data

.text

.globl power

power:
	li $t1, 1
	add $t0, $a1, $zero	# t0 = a1 (contador)
loop:
	mult $t1, $a0		# t1 = t1 * a0
	mflo $t1
	
	addi $t0, $t0, -1	# t0 = t0 -1 (decrementamos)
	bne $t0, $zero, loop	# while(t0 != 0) go to loop
	
	move $v0, $t1		# v0 = a0
	jr $ra
