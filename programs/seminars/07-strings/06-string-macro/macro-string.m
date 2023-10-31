#-----------------------------------------------------------------------------
# Сравнение двух строк.
# В макроопределение передаются адреса строк
.macro strcmp (%s1, %s2)
	la a0 %s1
	la a1 %s2
	jal strcmp
.end_macro

#-----------------------------------------------------------------------------
# Определение длины строки, ограниченной нулевым символом (asciz)
# Макроопределение получает адрес строки
.macro strlen (%s1)
	la a0 %s1
	jal strlen
.end_macro

#-----------------------------------------------------------------------------
# Определение длины строки, ограниченной буфером и нулевым символом (asciz)
# Макроопределение получает адрес строки и размер буфера в виде числа
.macro strnlen (%s1, %size)
	la a0 %s1
	li a1 %size
	jal strnlen
.end_macro