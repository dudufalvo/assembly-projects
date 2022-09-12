
	.data
	
	str1: .asciiz "Isto eh uma string de teste para o Lab 12!"

	# para o ponto 2
	.align 2			# align (str2) by the word boundary (ensures that &str2[0] is multiple of 4) 
	str2: .space 50			# reserve 50 bytes of empty space (in static data) <=> char str2[50] 
	    
	.text

lab12_2:
	la $a0, str2
	li $a1, 50
	jal read_string
	
	la $a0, str2
	jal print_string
	
	la $t9, str2
		
	jal read_int
	move $t0, $v0
	
	jal read_char
	move $t1, $v0

    loop:
    	addi $t9, $t9, 1
    	addi $t0, $t0, -1
    	bne $t0, $zero, loop
    	
    	sb $t1, 0($t9)
    	
    salta:
    	la $a0, 0x0A
    	jal print_char
    	
    	la $a0, str2
    	jal print_string

	# exit 
	li $v0, 10			# set $v0 = 10, syscall code to exit  
	syscall				# note: the exit syscall acts as "jr $ra" returning the control to Mars emulator 


modify_string:
	# Função Leaf

	# ESCREVA O SEU CODIGO AQUI
			
	
	jr $ra				# returns to the caller	


# FUNÇÕES DE ENTRADA E SA�?DA - INTERFACE COM O UTILIZADOR

# void print_char(char)
print_char:
	li $v0, 11
	syscall
	jr $ra				# jump to caller


# void print_string(char *). Includes 'line feed' afterwards  
print_string:
	li $v0, 4  			# set $v0 = 4, syscall to print string
	syscall				# print string 
	
	li $a0, 0xA			# set $a0 = 0xA = 'line feed' char
	li $v0, 11			# set $v0 = 11, syscall to print char
	syscall				# print 'line feed'
	
	jr $ra				# jump to caller


# void print_int(int). Includes 'line feed' afterwards 
print_int:
	li $v0, 1  			# set $v0 = 1, syscall to print int
	syscall				# print int
	
	li $a0, 0xA			# set $a0 = 0xA = 'line feed' char
	li $v0, 11			# set $v0 = 11, syscall to print char
	syscall				# print 'line feed'
	
	jr $ra				# jump to caller

# int read_int()
read_int:
	li $v0, 5
	syscall
	
	jr $ra
	
# char read_char()
read_char:
	li $v0, 12
	syscall
	
	jr $ra

# void read_string(char *, int) - $a0 contains address of input buffer, $a1 contain maximum number of read characters
read_string:
	li $v0, 8
	syscall
	
	jr $ra
