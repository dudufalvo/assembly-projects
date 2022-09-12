# Programa to use the 7-segments display

	.data
	array: .word 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
	.text
main: 
	li $a0, 0xFFFF0010
	la $s0, array
	
	li $a1, 0xFFFF0011
	la $s1, array
	
	li $t1, 16 	# counter com inicio em 16
	li $t2, 16 	# counter com inicio em 16
	
loop:	lw $t0, 0($s0)
	lw $t1, 0($s1)

	sb $t0, 0($a0)  	# armazenamos o byte de s0 no endereço de a0
	
	add $s0, $s0, 4 	# avanço proximo elemento na array
	addi $t1, $t1, -1 	# decremento na contagem
	bne $t1, $zero, loop 	#while(t1 > 0)
	
	sb $t1, 0($a1) 		# armazenamos o byte de s1 no endereço de a1
	
	add $s1, $s1, 4 	# avanço proximo elemento na array
	
	addi $t2, $t2, -1 	# decremento na contagem
	
	
	# exit 
	li $v0, 10		# set $v0 = 10, syscall code to exit
	syscall 
