	# .file	"discriminant.c"
	# .option nopic
	# .attribute arch, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	# .attribute unaligned_access, 0
	# .attribute stack_align, 16
	.text
	.align	2
	.globl	discriminant
	# .type	discriminant, @function
discriminant:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	sw	a0,-40(s0)
	sw	a1,-36(s0)
	sw	a2,-48(s0)
	sw	a3,-44(s0)
	sw	a4,-56(s0)
	sw	a5,-52(s0)
	fld	fa5,-48(s0)
	fmul.d	fa4,fa5,fa5
	fld	fa3,-40(s0)
	lui	a5,%hi(.LC0)
	fld	fa5,%lo(.LC0)(a5)
	fmul.d	fa3,fa3,fa5
	fld	fa5,-56(s0)
	fmul.d	fa5,fa3,fa5
	fsub.d	fa5,fa4,fa5
	fsd	fa5,-24(s0)
	fld	fa5,-24(s0)
	fsd	fa5,-64(s0)
	lw	a0,-64(s0)
	lw	a1,-60(s0)
	lw	s0,60(sp)
	addi	sp,sp,64
	jr	ra
	# .size	discriminant, .-discriminant
	.section	.rodata
	.align	2
.LC1:
	.string	"a = "
	.align	2
.LC2:
	.string	"b = "
	.align	2
.LC3:
	.string	"c = "
	.align	2
.LC4:
	.string	"Any x1 and x2: \n"
	.align	2
.LC5:
	.string	"No x1 and x2. c != 0\n"
	.align	2
.LC6:
	.string	"x1 = x2 = "
	.align	2
.LC7:
	.string	"d = "
	.align	2
.LC8:
	.string	"Real roots are absent\n"
	.align	2
.LC9:
	.string	"x1 = "
	.align	2
.LC10:
	.string	"; x2 = "
	.text
	.align	2
	.globl	main
	# .type	main, @function
main:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	PrintString
	call	ReadDouble
	sw	a0,-24(s0)
	sw	a1,-20(s0)
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	PrintString
	call	ReadDouble
	sw	a0,-32(s0)
	sw	a1,-28(s0)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	PrintString
	call	ReadDouble
	sw	a0,-40(s0)
	sw	a1,-36(s0)
	fld	fa5,-24(s0)
	fcvt.d.w	fa4,x0
	feq.d	a5,fa5,fa4
	beq	a5,zero,.L4
	fld	fa5,-32(s0)
	fcvt.d.w	fa4,x0
	feq.d	a5,fa5,fa4
	beq	a5,zero,.L5
	fld	fa5,-40(s0)
	fcvt.d.w	fa4,x0
	feq.d	a5,fa5,fa4
	beq	a5,zero,.L6
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	PrintString
	j	.L7
.L6:
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	PrintString
	j	.L7
.L5:
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	PrintString
	fld	fa4,-40(s0)
	fld	fa5,-32(s0)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-56(s0)
	lw	a0,-56(s0)
	lw	a1,-52(s0)
	call	PrintDouble
	li	a0,10
	call	PrintChar
	j	.L7
.L4:
	lw	a4,-40(s0)
	lw	a5,-36(s0)
	lw	a2,-32(s0)
	lw	a3,-28(s0)
	lw	a0,-24(s0)
	lw	a1,-20(s0)
	call	discriminant
	sw	a0,-48(s0)
	sw	a1,-44(s0)
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	PrintString
	lw	a0,-48(s0)
	lw	a1,-44(s0)
	call	PrintDouble
	li	a0,10
	call	PrintChar
	fld	fa5,-48(s0)
	fcvt.d.w	fa4,x0
	flt.d	a5,fa5,fa4
	beq	a5,zero,.L12
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	PrintString
	j	.L7
.L12:
	lw	a0,-48(s0)
	lw	a1,-44(s0)
	###call	sqrt
	sw	a0,-48(s0)
	sw	a1,-44(s0)
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	PrintString
	fld	fa5,-32(s0)
	fneg.d	fa4,fa5
	fld	fa5,-48(s0)
	fsub.d	fa4,fa4,fa5
	fld	fa5,-24(s0)
	fadd.d	fa5,fa5,fa5
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-56(s0)
	lw	a0,-56(s0)
	lw	a1,-52(s0)
	call	PrintDouble
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	PrintString
	fld	fa4,-48(s0)
	fld	fa5,-32(s0)
	fsub.d	fa4,fa4,fa5
	fld	fa5,-24(s0)
	fadd.d	fa5,fa5,fa5
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-56(s0)
	lw	a0,-56(s0)
	lw	a1,-52(s0)
	call	PrintDouble
	li	a0,10
	call	PrintChar
.L7:
	li	a5,0
	mv	a0,a5
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	# jr	ra
	# .size	main, .-main
	.section	.rodata
	li a0,7
	ecall
	.align	3
.LC0:
	.word	0
	.word	1074790400
	# .ident	"GCC: (g2ee5e430018) 12.2.0"
