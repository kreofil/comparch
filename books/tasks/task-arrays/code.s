.data
	sep:    .asciz  "--------\n"
	prompt: .asciz  "n - ?\n"
	error:  .asciz  "incorrect n!\n"
	overflowError: .asciz "overflow error\n"
	countElem: .asciz "Count iteration = "
	countAll: .asciz "Count All numbers = "
	sum: .asciz "Summ = "
	new_string: .asciz "\n"
	.align  2
	n:	.word	0
	array:  .space  64
.text
	in_data:
	        la 	a0, prompt
	        li 	a7, 4
	        ecall
	        li      a7 5
	        ecall
	        mv      t3 a0

	        ble     t3 zero fail_incorrect
	        li      t4 10

	        bgt     t3 t4 fail_incorrect
	        la	t4 n
	        sw	t3 (t4)

	        la      t0 array

	fill:   li a7 5
	        ecall
	        mv t2 a0
		sw      t2 (t0)
	        addi    t0 t0 4
	        addi    t3 t3 -1
	        bnez    t3 fill
	        la      a0 sep
	        li      a7 4
	        ecall

	        lw	t3 n
	        la      t0 array

	summ:
		lw      a0 (t0)
	if_number1_more_zero:
		bltz a0 if_number1_less_zero
		addi t6 t6 1
	if_number1_less_zero:
		bgez a0 if_number2_more_zero
		addi t6 t6 -1
	if_number2_more_zero:
		bltz t5 if_number2_less_zero
		addi t6 t6 1
	if_number2_less_zero:
		bgez t5 continue
		addi t6 t6 -1
	continue:
	        add     t5 t5 a0
	if_sum_more_zero:
		bltz     t5 if_sum_less_zero
		addi     t1 t1 1
	if_sum_less_zero:
		bgez     t5 last
		addi     t1 t1 -1
	last:

	 	beqz    t6 final
	 	if_not_zero:
	 		if_big_zero:
	 			bltz t6 if_few_zero
	 			bltz t1 overflow
	 		if_few_zero:
	 			bgez t6 final
	 			bgez t1 overflow
	final:
	        addi    t0 t0 4
	        addi    t3 t3 -1
	        sub     t6 t6 t6
	        sub     t1 t1 t1
	        bnez    t3 summ
	        beq     t6 t1 output

	overflow:
		sub  t5 t5 a0
		lw   a0 (t4)
		sub  t3 a0 t3
		la a0 overflowError
		li a7 4
		ecall
	output:
		la a0 sum
	        li a7 4
	        ecall

	        mv a0 t5
	        li a7 1
	        ecall

	        la a0 new_string
	        li a7 4
	        ecall

	        la a0 countElem
	        li a7 4
	        ecall

	        if: 	bnez t3 else
	        	lw a0 (t4)
	        	li a7 1
	        	ecall
	        	beqz t3 next
	        else:
	        	mv a0 t3
	        	li a7 1
	        	ecall

        next:
        	  la a0 new_string
	          li a7 4
	          ecall

	          la a0 countAll
	          li a7 4
	          ecall

	          lw a0 (t4)
	          li a7 1
	          ecall

	          li      a7 10
	          ecall
    fail_incorrect:
	         la 	a0, error
	         li 	a7, 4
	         ecall

	         li      a7 10
	         ecall
