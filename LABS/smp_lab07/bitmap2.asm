	# Lab 7: Bitmap display 
	# Bitmap Display settings: unit pixels 4x4, display width, height = 256 x 256
	.data
	
	.text

	# clear display
	jal clear_bitmap_display # set all pixels to black 
	
	li $t0, 0	# coluna
	li $t1, 0	# linha
	li $s0, 0x10040000	# endereço do primeiro pixel
	
loop:
	sll $t2, $t0, 2
	sll $t3, $t1, 10
	or $t4, $t3, $t2	# fazemos a mask
	sw $t4, 0($s0)		# guardamos a cor no endereço a0
	addi $s0, $s0, 4	# andamos com a0 em um pixel
	addi $t0, $t0, 1
	bne $t0, 64, loop	# if (t0 < 64) branch to loop
	li $t0, 0		# reset coluna
	addi $t1, $t1, 1	
	bne $t1, 64, loop
	
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
