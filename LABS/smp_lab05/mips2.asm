.data
tab: .word 1,2,3,4,5

.text
	la $a0, tab
	li $t0, 5
	li $t1, 0 #variavel controlo ciclo
	li $t2, 0 #soma
	
ciclo:
	beq $t1, $t0, fim #comparação
	lw $t3, 0($a0) # coloca em t3 o valor do primeiro elemento da tabela
	add $t2, $t2, $t3 # t2+=t3 (soma += tab[0])
	
	addi $a0, $a0, 4 # passa o endereço para o elemento 1
	addi $t1, $t1, 1 # incremento o contador

	j ciclo
fim: