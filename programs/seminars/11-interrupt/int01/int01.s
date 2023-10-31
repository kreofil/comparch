        li      a0 2                    # разрешим прерывания от клавиатуры
        sw      a0 0xffff0000 t0
        la      t0 handler
        csrw    t0 utvec                # Инициализируем ловушку
        csrsi   uie 0x100               # Разрешим внешние прерывания
        csrsi   ustatus 1               # Включим олбработку прерываний
        li      a0 0
loop:   beqz    a0 loop                 # вечный цикл
        li      t0 0x1b
        beq     a0 t0 done              # ESC — конец
        li      a7 11                   # выведем символ
        ecall
        li      a0 0                    # затрём a0
        j       loop
done:   li      a7 10
        ecall

handler:                                # очень грязный код обработчика
        lw      a0 0xffff0004           # считаем символ
                uret
