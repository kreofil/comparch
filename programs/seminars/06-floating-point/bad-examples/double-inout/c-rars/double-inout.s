	# .file	"double-inout.c"
	# .option nopic
	# .attribute arch, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	# .attribute unaligned_access, 0
	# .attribute stack_align, 16
	.text
	.section	.rodata
	.align	2
.LC0:
	.string	"a = "
	.align	2
.LC1:
	.string	"b = "
	.align	2
.LC2:
	.string	"c = "
	.align	2
.LC3:
	.string	"; b = "
	.align	2
.LC4:
	.string	"; c = "
	.text
	.align	2
	.globl	main
	# .type	main, @function
main:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	PrintString
	call	ReadDouble
	fsd	fa0,-24(s0)
	#fsw	fa1,-20(s0)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	PrintString
	call	ReadDouble
	fsd	fa0,-32(s0)
	#fsw	fa1,-28(s0)
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	PrintString
	call	ReadDouble
	fsd	fa0,-40(s0)
	#fsw	fa1,-36(s0)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	PrintString
	fld	fa0,-24(s0)
	#flw	fa1,-20(s0)
	call	PrintDouble
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	PrintString
	fld	fa0,-32(s0)
	#flw	fa1,-28(s0)
	call	PrintDouble
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	PrintString
	fld	fa0,-40(s0)
	#flw	fa1,-36(s0)
	call	PrintDouble
	li	a0,10
	call	PrintChar
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	li a7,10
	ecall
	# jr	ra
	# .size	main, .-main
	# .ident	"GCC: (g2ee5e430018) 12.2.0"
