    # Lab 10 - question 2 : fibonacci_recursive
    .data

    .text
    .globl fibonacci_recursive

fibonacci_recursive:
    # C function prototype: int fibonacci_recursive (int n)
    # input parameters: $a0 (n)
    # return parameter: $v0 (fibonacci value)
    fib:
    	addi $sp, $sp, -12
    	sw $ra, 8($sp)
    	sw $s0, 4($sp)
	
	addi $v0, 0
	beq $a0, $zero, fim
	
	addiu $v0, $zero, 1
	addiu $t0, $zero, 1
	
	beq $a0, $t0, fim
	
	addiu $a0, $a0, -1
	sw $a0, 0($sp)
	jal fib
	
	add $s0, $v0, $zero
	lw $a0, 0($sp)
	addiu $a0, $a0, -1
	jal fib
	
	add $v0, $v0, $s0
	
    fim:
    	lw $s0, 4($sp)
    	lw $ra, 8($sp)
    	addi $sp, $sp, 12
        jr $ra             # jump to caller