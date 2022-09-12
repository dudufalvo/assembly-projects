.data
var: .word 100, 200, 300, 400

.text
la $t0, var
lw $t1, 4($t0)

# SE QUISESSE QUE MANDASSE O SEGUNDO ELEMENTO -> lw $t1, 4($to) [VAI DE 4 EM 4]

addi $t2, $t1, 200
sw $t2, 0($t0)

li $v0, 1 #add $vo, s0, 1
move $a0, $t2 # add $a0, $t2, $0

syscall