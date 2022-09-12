.data
var: .word 100, 200, 300, 400

.text
la $t0,var   #armazena o add da memoria que contem var
lw $t1, 4($t0)   #funciona tp um array, pulando 4 bytes ( sizeof(int) ) vamos para segundo numero armazenado : 200
addi $t2, $t1, 200
sw $t1, 0($t0)

li $v0, 1   # "load itermdiate" equivalente a  addi $v0, $0, 1
move $a0, $t2   # equivalente a addi $a0, $t2, $0
syscall

