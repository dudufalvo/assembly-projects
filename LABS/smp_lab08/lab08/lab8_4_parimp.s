.data

.text

.globl par_ou_impar

par_ou_impar:
	andi $v0, $a0, 0x0001
	jr $ra
