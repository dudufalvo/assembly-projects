    # Lab 9 - question 1 : max / min functions (direct exhaustive cmp)
    .data

    .text
    .globl	max
    .globl	min

max:
    # C function prototype: int max (int n1, int n2, int n3, int n4)
    # input parameters: $a0 (n1), $a1 (n2), $a2 (n3), $a3 (n4)
    # return parameter: $v0 (max value)
    blt $a0, $a1, A1
    blt $a0, $a2, A2
    blt $a0, $a3, A3
    move $v0, $a0
    j end
A1:
    blt $a1, $a2, A2
    blt $a1, $a3, A3
    move $v0, $a1
    j end
A2:
    blt $a2, $a3, A3
    move $v0, $a2
    j end
A3:
    move $v0, $a3
end:                    # $v0 already has the max value
    jr	$ra             # jump to caller
    


min:
    # C function prototype: int min (int n1, int n2, int n3, int n4)
    # input parameters: $a0 (n1), $a1 (n2), $a2 (n3), $a3 (n4)
    # return parameter: $v0 (min value)
    bgt $a0, $a1, B1
    bgt $a0, $a2, B2
    bgt $a0, $a3, B3
    move $v0, $a0
    j end
B1:
    bgt $a1, $a2, B2
    bgt $a1, $a3, B3
    move $v0, $a1
    j end
B2:
    bgt $a2, $a3, B3
    move $v0, $a2
    j end
B3:
    move $v0, $a3
                        # $v0 already has the min value
    jr	$ra             # jump to caller

#--------PROFESSOR-------------
#min:
#	move $v0, $a0
#	ble $v0, $a1, salta
#	move $v0, $a1
#salta:
#	ble $v0, $a2, salta2
#	move $v0, $a2
#salta2:
#	ble $v0, $a3, fim
#	move $v0, $a3
#fim:
#	jr $ra