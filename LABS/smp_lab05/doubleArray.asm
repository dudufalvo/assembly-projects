
# Read array, double each element, store and print

	.data
array: 	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10	# <=> int array[10] ={1,...,10}   
n: 	.word 10				# <=> int n = 10	(array size)

	.text
main: 

	la $s0, array		# load address of array into $s0:	$s0 = &array[0]

	la $s1, n 		# load address of n into $s1:		$s1 = &n
	lw $s2, 0($s1)		# load the value of n to $s2

	# ESCREVA O SEU CODIGO AQUI
	# implementar um ciclo para:
	# - ler word da memoria 
	# - duplicar o seu valor (sugestao: use um shift left logical
	# - guardar a nova word na mesma posicao da memoria
 	# nota: o ciclo deve iterar n (lido para o registo $s2) vezes



	
	#print int    
	li $v0, 1		# set $v0=1, syscall code for print int
	move $a0, $t1		# copy $a0 = $t1 
	syscall 
	
	#print char    
	li $v0, 11		# set $v0=11, syscall code for print char
	li $a0, 0x20		# $a0 = 0x20 = ASCII code for 'space' character
	syscall 
		
	addi $s0, $s0, 4	# update array pointer (add 4 bytes)	 	  
	addi $t0, $t0, 1	# $t0++  
	blt $t0, $t7, loop	# while ($t0 < $t7 = n) -> branch to loop
	

	# exit 
	li $v0, 10		# set $v0 = 10, syscall code to exit
	syscall 
