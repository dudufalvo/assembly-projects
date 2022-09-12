	.data
	#direita = 0xFFFF0010
	#esquerda: = 0xFFFF0011
	numbers: .word 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
	byte: .byte 0xFFFF0001

	.text
main:
	la $a0, 0xFFFF0010
	la $a1, 0xFFFF0011
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	lw $t0, $s0	#auxiliar inicio
	lw $t1, $s1	#auxiliar fim
	
cescente:
	

exit:
	li $v0, 10		# set $v0 = 10, syscall code to exit
	syscall 