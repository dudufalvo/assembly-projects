.data
#	array: .word 56, 65, 123, 324, 123, 112, 1, 54, 21, 13
#	n: .word 10
#	space: .byte '\n'
	frase: .asciiz "digite uma numero: "
.text
main:
	la $a0, frase	# passagem da frase como parâmetro
	li $v0, 4	# print de string em a0
	syscall
	
	li $v0, 5	# pedimos um valor do usuário
	syscall
	
	move $s0, $v0 	# armazenamos o valor em s0
	sll $s1, $s0, 1 	# s1 = 2*s0
	
	addi $s0, $s0, 1
	
#	la $t0, array
#	lw $s0, n
	
loop:
	move $a0, $s0
	li $v0, 1
	syscall
	
	addi $s0, $s0, 1
	
	bne $s0, $s1, loop
#	lw $a0, 0($t0)
	
#	li $v0, 1
#	syscall
#	
#	la $a0, space
#	li $v0, 4
#	syscall
	
#	addi $t0, $t0, 4
#	addi $s0, $s0, -1
	
#	bnez $s0, loop 
	
	

		
	li $v0, 10
	syscall

