		.data

		.text
		.globl	calcula_f
	
calcula_f:
	addi $sp, $sp, -24
	lw $t0, 0($a0)
	lw $t1, 4($a0)
	lw $t2, 8($a0)
	lw $t3, 12($a0)
	lw $t4, 16($a0)
	
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	sw $t4, 16($sp)
	
	sw $ra, 20($sp)
	
	jal PolyCalc
	lw $ra, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra
	
PolyCalc:
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	lw $t4, 16($sp)
	
	li $t5, 5
	
	add $t0, $t0, $t1
	mult $t0, $t5
	mflo $t0
	
	mult $t3, $t4		
	mflo $t3
	
	li $t6, 2
	
	mult $t3, $t6
	mflo $t3
	sub $t3, $t2, $t3
	
	mult $t0, $t3
	mflo $v0

	jr $ra
