# Autores:
# Rafael Moreno 13-10936, Daniela Carfora 15-10242
# Prof: Angel Terrones

# Мероприятие 1
# Реализация алгоритма Бута для знакового умножения. 32-битные числа.
# Октябрь 2019 г.

############      Первоначальные определения    ################

	.eqv uno_ceros 0x80000000
	.eqv ceros_uno 0x00000001

	.macro print_msg(%a0)
		la a0, %a0                 # a0 = the address of the string
		li a7, 4
		ecall
	.end_macro

	.macro print_hex(%int)
		mv a0, %int               # a0 = integer to print
		li a7, 34
		ecall
	.end_macro

	.macro scan_int(%save)
		li a7, 5                  # a0 = the int
		ecall
		mv %save, a0
	.end_macro

	.macro SUM_R_R(%target, %carry)
		add t3, t4, %target
		sltu a3, t3, t4			# carry? Save carry in a3
		add a3, a3, %carry		# add carry
		and a3, a3, s3                  # act carry
		mv t4, t3	                # act P(HI)
	.end_macro

	.macro get_sign(%rd, %r1)
		and %rd, %r1, s0 	# %rd get the sign of %r1
		sltz %rd, %rd		# Take it to LSB
	.end_macro


.data

	numA: .asciz  "Затем вставьте числа для умножения \n Сомножитель A:"
	numB: .asciz  "Сомножитель B: "
	msg_1: .asciz  "A * B\n"
	msg_2: .asciz  "HI = "
	msg_3: .asciz  "\nLO = "
	white: .asciz "\n------------------------------------\n"
	again: .asciz "\n\nПопробуйте еще раз? Да = 1, Нет = 0. Ответ = "

.text
	main:

	# Bloque 1. Data load
	li t6, 32               # number of bits of multiplicand and multiplier, cnt for the loop
	print_msg(numA)
	scan_int(t0)		# t0 save multiplicand m = A
	print_msg(numB)
	scan_int(t1)		# t1 save multiplier r
	neg t2, t0		# t2 save -m = S

	# Bloque 2. Get the signs
	li s0, uno_ceros	# bit mask
	li s3, ceros_uno	# bit mask
	get_sign(a1,t0)		# a1 get sign of A in LSB
	bnez a1, negative
	get_sign(a2,t2)		# a2 get sign of S in LSB
	negative:
				# a3 MSB extra bit of P
				# a4 LSB extra bit of P
				# both zero initially

	# Bloque 3. Booth's algorithm
	loop:
	and s1, s3, t1		# s1 get LSB of P (LO)
	beq s1, a4, shift	# branch if LSB of P and LSB extra bit of P are equal, donґt add

	bgt s1, a4, P_S		# if 10 do P + S else do P + A
	SUM_R_R(t0, a1)
	b shift			# break
	P_S:
	SUM_R_R(t2, a2)

	shift:
	sgtz a4, s1		# save LSB of P in LSB extra bit of P
	and s2, s3, t4		# s2 LSB of P (HI)
	srli t1, t1, 1		# shift aritmetic of P
	beqz s2, noSum		# only if LSB of P HI is 1 add 1000(...) to t1 already shifted with 0
	add t1, t1, s0
	noSum:
	beqz a3, s_logic	# if MSB extra bit of P is 1 then do aritmetic shift else do logic shift
	srai t4, t4, 1
	b continue		# break
	s_logic:
	srli t4, t4, 1

	continue:
	addi t6, t6, -1         # act cnt
	bgtz t6, loop		# repeat 32 times

	# Bloque 4. Print result
	print_msg(msg_1)
	print_msg(msg_2)
	print_hex(t4)
	print_msg(msg_3)
	print_hex(t1)

	# Bloque 5. Ask new iteration
	print_msg(again)
	scan_int(a0)
	beqz a0, end
	add t4, zero, zero     # reset P(HI)
	add a2, zero, zero     # reset S MSB extra bit
	add a3, zero, zero     # reset P MSB extra bit
	add a4, zero, zero     # reset P LSB extra bit
	print_msg(white)
	j main

	# Bloque 7. End
	end:
	li a7, 10
	ecall
