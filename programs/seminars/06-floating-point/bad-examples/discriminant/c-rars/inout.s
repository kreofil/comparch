#-----------------------------------------------------------------
	.globl	PrintInt
#	Вывод числа int на консоль RARS
# PrintInt  1 Prints an integer
# a0 = integer to print N/A
PrintInt:
	li a7 1
	ecall
	ret

#-----------------------------------------------------------------
# Вывод числа double на консоль RARS
# PrintDouble  3:    Prints a double precision floating point number.
# In: fa0 = double to print. Out: N/A
	.globl	PrintDouble
#	Печать числа double
PrintDouble:
	li a7 3
	ecall
	ret

#-----------------------------------------------------------------
# Вывод строки на консоль RARS
# PrintString    4:   Prints a null-terminated string to the console.
# In: a0 = the address of the string   Out: N/A
	.globl	PrintString
#	Печать строки
PrintString:
	li a7 4
	ecall
	ret

#-----------------------------------------------------------------
# Чтение целого числа в консоли RARS
# ReadInt 5: Reads an int from input console.
# In: N/A. Out: a0 = the int
	.globl	ReadInt
ReadInt:
	li a7 5
	ecall
	ret

#-----------------------------------------------------------------
# Чтение числа double в консоли RARS
# ReadDouble 7: Reads a double from input console.
# In: N/A. Out: fa0 = the double
	.globl	ReadDouble
ReadDouble:
	li a7 7
	ecall
	ret

#-----------------------------------------------------------------
# Вывод символа на консоль RARS
# PrintChar  11: Prints an ascii character.
# In: a0 = character to print (only lowest byte is considered). Out: N/A
	.globl	PrintChar
PrintChar:
	li a7 11
	ecall
	ret
