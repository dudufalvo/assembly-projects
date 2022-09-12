    # Lab 10 - question 2 : fibonacci_cycle
    .data

    .text
    .globl fibonacci_cycle

fibonacci_cycle:
	# C function prototype: int fibonacci_cycle (int n)
	# input parameters: $a0 (n)
	# return parameter: $v0 (fibonacci value)


	bne $a0, $zero, pass1
	li $v0, 0
	j fim

    pass1:
	bne $a0, 1, init
	li $v0, 1
	j fim
	
    init:
        li $t0, 0
        li $t1, 1
        li $t2, 2	# counter
    loop:
    	add $v0, $t1, $t0
    	
    	addi $t0, $t1, 0
    	addi $t1, $v0, 0
    	
    	addi $t2, $t2, 1
    	bne $t2, $a0, loop
	
    fim:                   # $v0 has the value to return
        jr $ra             # jmp to caller
