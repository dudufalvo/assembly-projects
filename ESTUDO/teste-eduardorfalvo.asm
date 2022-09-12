
	.data
	
tab: 	.word 2, -1, 3, 0
n: 	.word 4
prod: 	.space 50
sum:	.space 50
erro:	.asciiz "ERRO UM DOS ELEMENTOS EH ZERO"

	.text

main: 
	# inicializamos os valores
	la $a0, tab
	la $a1, n
	lw $a1, 0($a1)			
	la $a2, prod
	la $a3, sum
	
	# chamamos a funcao passando os argumentos
	jal calcula_prod_sum		# non-leaf, needs another stack-frame
	move $a0, $v0
	
	jal print_int
			
	# Exit 
	li $v0, 10			# set $v0 = 10, syscall code to exit  
	syscall				# note: the exit syscall acts as "jr $ra" returning the control to Mars emulator 


contemnulo:
	# int contemnulo(int *tab, int n)	
	# assumimos que nao ha zeros
	li $v0, 0
	
	# fazemos um ciclo para verificar os elementos
	loop_CN:
	lw $t0, 0($a0)
	bnez $t0, salta	# caso nao seja zero, pulamos
	li $v0, 1	# caso seja, reescrevemos o valor de v0 para 1
	
	salta:
	addi $a0, $a0, 4
	addi $a1, $a1, -1
	bnez $a1, loop_CN
	
	
	# retornamos v0
	jr $ra				# returns to the caller	


calcula_prod_sum:
	# int calcula_prod_sum(int *tab, int n, int *prod, int *sum)
	# guardamos as informacoes na stack
	addi $sp, $sp, -24
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $a3, 16($sp)
	
	# verificamos se ha algum elemento nulo
	jal contemnulo
	bnez $v0, saltaPROerro	# se ha, salatamos para saltaPROerro
	
	# se nao ha, recuperamos os dois primeiros parametros
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	
	li $t1, 1	# inicializa produtorio
	li $t2, 0	# inicializa somatorio
	
	# ciclo percorrendo os valores da tabela
	loop_CPS:
	lw $t0, 0($a0)	# carrega o valor em t0
	
	# multiplica o valor atual pelas multiplicacoes passadas (t1 = t1 * t0)
	mult $t1, $t0
	mflo $t1
	
	# adiciona o valor atual pelas adicoes passadas (t2 = t2 + t0)
	add $t2, $t2, $t0
	
	# atualiza o elemento e o contador
	addi $a0, $a0, 4
	addi $a1, $a1, -1
	bnez $a1, loop_CPS
	
	# guardamos o produtorio e somatorio nos enderecos passados
	sw $t1, 12($sp)
	sw $t2, 16($sp)
	
	# produtorio - somatorio
	sub $v0, $t1, $t2
	j saltaSEMerro
	
	saltaPROerro:
	la $a0, erro
	li $v0, 4
	syscall
	
	saltaSEMerro:
	# recupera valores na stack
	lw $ra, 0($sp)
	lw $a2, 12($sp)
	lw $a3, 16($sp)
	addi $sp, $sp, 24
	
	jr $ra				# returns to the caller	



# FUNCOES DE ENTRADA E SAIDA - INTERFACE COM O UTILIZADOR
# void print_int(int). Includes 'line feed' afterwards 
print_int:
	li $v0, 1  			# set $v0 = 1, syscall to print int
	syscall				# print int
	
	li $a0, 0xA			# set $a0 = 0xA = 'line feed' char
	li $v0, 11			# set $v0 = 11, syscall to print char
	syscall				# print 'line feed'
	
	jr $ra				# jump to caller
