    # Lab 9 - question 2 : (max/min functions revisited)

    .data

    .text
    .globl	max
    .globl	min

max:
    # C function prototype: int max (int *table, int n);
    # input parameters: $a0 (table ptr), $a1 (n)
    # return parameter: $v0 (max value)
    
    move $t0, $a1	# t0 = count
    addi $t0, $t0, -1
    
    lw $v0, 0($a0)	# v0 = tab[0]
    addi $a0, $a0, 4	# proximo valor
    
loop:
    lw $t3, 0($a0)	# t3 = tab[1]
    
    bgt $v0, $t3, skip	# if(v0>t3) go to skip
    move $v0, $t3	# else v0 = t3 = tab[1]
    
skip:
    addi $a0, $a0, 4	# proximo valor
    addi $t0, $t0, -1	# count-=1
    bne $t0, $zero, loop
    
end:                    # $v0 has the max value
    jr	$ra             # jmp to caller


min:
    # C function prototype: int min (int*table, int n);
    # input parameters: $a0 (table ptr), $a1 (n)
    # return parameter: $v0 (min value)

    move $t0, $a1	# t0 = count
    addi $t0, $t0, -1
    
    lw $v0, 0($a0)	# v0 = tab[0]
    addi $a0, $a0, 4	# proximo valor
    
loop2:
    lw $t3, 0($a0)	# t3 = tab[1]
    
    blt $v0, $t3, skip2	# if(v0<t3) go to skip
    move $v0, $t3	# else v0 = t3 = tab[1]
    
skip2:
    addi $a0, $a0, 4	# proximo valor
    addi $t0, $t0, -1	# count-=1
    bne $t0, $zero, loop2
    
end2:                    # $v0 has the min value
    jr	$ra             # jmp to caller

