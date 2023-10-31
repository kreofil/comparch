	.globl	PrintInt
#	Печать целого числа
PrintInt:
	li a7 1
	ecall
	ret

# Ввод целого числа
# ReadInt 5: Reads an int from input console.
# In: N/A. Out: a0 = the int
	.globl	ReadInt
ReadInt:
	li a7 5
	ecall
	ret

# Печать символа
	.globl	PrintChar
PrintChar:
	li a7 11
	ecall
	ret
