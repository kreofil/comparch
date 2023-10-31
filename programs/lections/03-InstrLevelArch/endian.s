# A program that checks the order of data placement
# in the computer memory of the current architecture

.data
common: .word 1
number: .word 0x01020304
mes_little_endian: .asciz "Little endian\n"
mes_big_endian:    .asciz "Big endian\n"
separator:    	   .asciz ": "

.text
main:
    la  t0, common
    lb	t0, 0(t0)
    li  t1, 1
    beq t0, t1, little_endian
    la  t1, mes_big_endian
    j   output
little_endian:
    la  t1, mes_little_endian

output:
    # Вывод результата проверки
    mv a0, t1
    li a7, 4
    ecall

# Пословный вывод с младших байтов 
    la  t0, number
    li  t1, 4
    mv  t2, zero
loop:
    mv	a0, t0
    li	a7, 1
    ecall
    la	a0, separator
    li	a7, 4
    ecall
    lb	a0, (t0)
    li	a7, 34
    ecall
    li	a0, '\n'
    li	a7, 11
    ecall
    addi t0, t0, 1
    addi t2, t2, 1
    bne t1, t2, loop
    li a7, 10
    ecall
