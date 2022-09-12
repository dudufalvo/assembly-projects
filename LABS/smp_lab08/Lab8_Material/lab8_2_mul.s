	.data

	.text
	.globl	multiplica	# global scope (label visible for other files)	

multiplica:
	mult 	$4, $5		# mult $a0, $a1
	mflo 	$2		# mflo $v0


	jr	$ra		# jump to caller

