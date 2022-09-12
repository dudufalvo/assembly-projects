.text
	li $v0, 5
	add $a0, $t0, $0
	syscall
	
	add $t0, $v0, $0 # valor dado
	li $t1, 1
	sll $t2, $t1, 1 # final do ciclo
	
ciclo:
	beq $t0, $t2, fim
	
	li $v0,1
	add $a0, $t1, $0
	syscall
	add $t0, $t0, $t1
	
	j ciclo
fim: 