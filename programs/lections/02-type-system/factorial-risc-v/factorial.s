# Нахождение факториала
.data    
    arg:  	.asciz "n? "
    result: 	.asciz "n! = "
    f:		.word 1
.text
start:
    la 	a0, arg		# Подсказка для первого числа
    li 	a7, 4       	# Вызов №4. Вывод строки
    ecall
    li  a7, 5	    	# Вызов №5. Ввод целого n
    ecall
    mv  t1, a0		# t1 = n
    la  t2, f	        # t2 = &f
    lw	t3, 0(t2)	# t3 = f
    li	t4, 2
loop:
    blt t1, t4, end	# if(n < 2) goto end
    mul t3, t3, t1	# f *= n
    li	t5, -1
    add t1, t1, t5	# n--
    b	loop
end:
    la a0, result       # Подсказка для результата
    li a7, 4            # Системный вызов №4
    ecall
    li  a7, 1 		# Вывести десятичное число
    mv  a0, t3
    ecall
    li 	a0, '\n'        # Перевод строки
    li  a7, 11          # Системный вызов №11
    ecall
    li      a7 10       # №10 — останов программы
    ecall

