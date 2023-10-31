	# .file	"test-inout.c"
	# .option nopic
	# .attribute arch, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	# .attribute unaligned_access, 0
	# .attribute stack_align, 16
	.text
	.align	2
	.globl	gcd
	# .type	gcd, @function
gcd:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	j	.L2
.L3:
	lw	a5,-40(s0)
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	sw	a5,-40(s0)
.L2:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	rem	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	bne	a5,zero,.L3
	lw	a5,-40(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	# .size	gcd, .-gcd
	.align	2
	.globl	main
	# .type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	call	ReadInt
	sw	a0,-20(s0)
	call	ReadInt
	sw	a0,-24(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	gcd
	sw	a0,-28(s0)
	lw	a0,-28(s0)
	call	PrintInt
	li	a0,10
	call	PrintChar
	li	a5,0
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	# jr	ra
	# .size	main, .-main
	# .ident	"GCC: (g2ee5e430018) 12.2.0"
	li a7,10
	ecall