.data

.text

.globl FindChar

FindChar:
	move $t0, $zero		# t0 = 0 (contador)

loop:
	lbu $t1, 0($a0)		# t1 = caracteres atuais
	beq $t1, $zero, fim	# if (caracter_atual != '.') => go to loop

	addi $a0, $a0, 1	# a0 += 1, atualiza o caracter que estamos vendo
	
	bne $t1, $a1, salta	# if (caracter_atual == caracter_dado) => t0 +=1
	addi $t0, $t0, 1	# else => go to loop
salta:
	j loop
	
fim:
	move $v0, $t0		# v0 = t0
	jr $ra
