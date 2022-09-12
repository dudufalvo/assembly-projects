    # Lab 9 - question 3 : max / min functions (w/ routine calls: max2, min2)
    .data

    .text
    .globl	max
    .globl	min

max:
    # C function prototype: int max (int n1, int n2, int n3, int n4)
    # input parameters: $a0 (n1), $a1 (n2), $a2 (n3), $a3 (n4)
    # return parameter: $v0 (max value)

    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    
    jal max2
    move $a0, $v0
    move $a1, $a2
    
    jal max2
    move $a0, $v0
    move $a1, $a3
    
    jal max2
    
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)

    addi $sp, $sp, 12
    jr	$ra             # jmp to caller


# Compute the max bewteen two integers
# C function prototype: int max2 (int a, int b)
# input parameters: $a0 (a), $a1 (b)
# return parameter: $v0 (max value)
max2:
    move $v0, $a0
    bgt $v0, $a1, skip1
    move $v0, $a1
    
skip1:
    jr	$ra             # jmp to caller



# -----------------------------------------------------------------------------
min:
    # C function prototype: int min (int n1, int n2, int n3, int n4)
    # input parameters: $a0 (n1), $a1 (n2), $a2 (n3), $a3 (n4)
    # return parameter: $v0 (min value)

    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    
    jal min2
    move $a0, $v0
    move $a1, $a2
    
    jal min2
    move $a0, $v0
    move $a1, $a3
    
    jal min2
    
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)

    addi $sp, $sp, 12

                        # $v0 has the min value
    jr	$ra             # jmp to caller


# Compute the min bewteen two integers
# C function prototype: int min2 (int a, int b)
# input parameters: $a0 (a), $a1 (b)
# return parameter: $v0 (min value)
min2:
    move $v0, $a0
    blt $v0, $a1, skip2
    move $v0, $a1
    
skip2:
    jr	$ra             # jmp to caller
