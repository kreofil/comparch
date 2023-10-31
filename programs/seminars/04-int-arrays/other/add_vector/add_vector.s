#
# Использование для сложения векторов байт команды сложения 32-х разрядных слов
#
    .data
vectorA:
    .byte 1, 2, 3, 4,  5,  6,  7,  8
vectorB:
    .byte 2, 4, 6, 8, 10, 12, 14, 16
vectorC:
    .space 8

    .text
main:
    la   s0, vectorA	# Загрузили адрес А
    lw  s1, 0(s0)	# Загрузили первые 4 байта A
    lw  s2, 8(s0)	# Загрузили первые 4 байта B
    add  s3, s1, s2	
    sw   s3, 16(s0)
    lw  s1, 4(s0)	
    lw  s2, 12(s0)
    add  s3, s1, s2	
    sw   s3, 20(s0)
# Здесь пошел цикл вывода данных
    addi t0, s0, 16
    addi t1, t0, 8
loop:
    lbu  a0, 0(t0)
    li   a7, 1
    ecall
    li   a0, ' '
    li   a7, 11
    ecall
    addi t0, t0, 1
    bne  t0, t1, loop
