	.data                    # vai para a memoria de dados
var:   	.word 10, 20, 30, 35 
texto:	.asciiz "isto e uma string"

      	 	        	
	.text                    # vai para a memoria de 

main:
	addi $s0, $0, 10
	addi $s1, $zero, 20
	
	add $t0, $s0, $0
	add $t1, $s1, $0
	add $t2, $t0, $t1
	add $t3, $t1, $t2
	add $t4, $t2, $t3
	add $t5, $t3, $t4
	add $t6, $t4, $t5
	add $t7, $t5, $t6
	
	li $v0, 1
	add $a0, $t7, $0
	syscall