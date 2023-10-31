.text
        lui     t6 0xffff0            # база MMIO
        mv      t5 zero               # счётчик
        mv      t4 zero               # предыдущее значение
loop:
        mv      t1 zero               # общий результат сканирования
        li      t0 1                  # первый ряд
        sb      t0 0x12(t6)           # сканируем
        lb      t0 0x14(t6)           # забираем результат
        or      t1 t1 t0              # добавляем биты в общий результат
        li      t0 2                  # второй ряд
        sb      t0 0x12(t6)
        lb      t0 0x14(t6)
        or      t1 t1 t0
        li      t0 4                  # третий ряд
        sb      t0 0x12(t6)
        lb      t0 0x14(t6)
        or      t1 t1 t0
        li      t0 8                  # четвёртый ряд
        sb      t0 0x12(t6)
        lb      t0 0x14(t6)
        or      t1 t1 t0
        beq     t1 t4 same
        sb      t1 0x10(t6)           # запишем результат в биты окошка
        mv      a0 t1                 # выведем результат как двоичное
        li      a7 35
        ecall
        li      a0 10
        li      a7 11
        ecall
        addi    t5 t5 1               # счётчик
        sb      t5 0x11(t6)           # запишем его в другое окошко
        mv      t4 t1
        li      t2 20
same:   ble     t5 t2 loop

        li      a7 10
        ecall
