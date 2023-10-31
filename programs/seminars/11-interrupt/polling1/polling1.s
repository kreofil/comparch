loop:   lb      t0 0xffff0000          # готовность ввода
        andi    t0 t0 1                # есть?
        beqz    t0 loop                # нет — снова
        lb      a0 0xffff0004          # считаем символ
        li      a7 11                  # выведем его
        ecall
        b       loop
