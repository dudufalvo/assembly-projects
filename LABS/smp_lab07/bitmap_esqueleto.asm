	# Lab 7: Bitmap display 
	# Bitmap Display settings: unit pixels 4x4, display width, height = 256 x 256
	.data
	
	.text

	# clear display
	jal clear_bitmap_display # set all pixels to black 
	li $t0, 0xFF0000		# carregamos s0 com a cor vermelha
	li $s0, 0x10040000
	li $s1, 0x10040050
	li $s3, 0x10041400

red_square:
	sw $t0, 0($s0)			# guardamos a cor no endereço a0
	addi $s0, $s0, 4		# andamos com a0 em um pixel
	blt $s0, $s1, red_square # if (a0 < a0 + 4*20pixels) branch to red_square
	addi $s0, $s0, 0xB0
	addi $s1, $s1, 0x100
	blt $s1, $s3, red_square
	
	# exit
	li $v0, 10         		# $v0 = 10, system call for exit
	syscall				# exit
	
# print_int(int), $4 = $a0 = integer
print_int:
	li $v0, 1
	syscall
	jr $ra

# void clear_bitmap_display(void) 
# clear bitmap display (set all pixels to black)
clear_bitmap_display:
	li $t9, 0x10040000		# Bitmap Display base address (heap)
clr_loop:
	sw $zero, 0($t9)		# *( $t9 ) = 0 (write 4 bytes w/ zeros)
	addi $t9, $t9, 4		# $t9 = $t9 + 4 (move forward 4 bytes) 
	blt $t9, 0x10044000, clr_loop 	# if ($t9 < base_adress + 4 * 4096 = 0x10044000) branch to clr_loop
	jr $ra					# jump to caller
