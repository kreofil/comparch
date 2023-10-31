        li      t0 1
        sb      t0 0xffff0008 t1
        li      t1 0
loop:   beqz    t1 noout                # выводить не надо
loopi:  lb      t0 0xffff0008           # готовность вывода
        andi    t0 t0 1                 # есть?
        beqz    t0 loopi                # а надо! идём обратно
        sb      t1 0xffff000c t2        # запишем байт
        li      t1 0                    # обнулим данные
noout:  lb      t0 0xffff0000           # готовность ввода
        andi    t0 t0 1                 # есть?
        beqz    t0 loop                 # нет — снова
        lb      t1 0xffff0004           # считаем символ
        b       loop      
