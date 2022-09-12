	.file	1 "lab8_1.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.abicalls
	.option	pic0
	.rdata
	.align	2
$LC0:
	.ascii	"Lab %d \012\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	li	$2,8			# 0x8
	sw	$2,24($fp)
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
	move	$4,$2
	lw	$5,24($fp)
	jal	printf
	nop

	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
