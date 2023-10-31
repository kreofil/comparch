.eqv    COUNTER 0xFFFF0013
.data
count:  .word   0
.text
        li      s2 COUNTER      # CSR счётчика
        li      t1 1
        sb      t1 (s2)         # Надо записать байт

        la      t0 handle       # Адрес обработчика
        csrw    t0 utvec        # CAS вектора обработки ловушек
        csrwi   uie 0x10        # Включим обработку таймерных прерываний
        csrwi   ustatus 1       # Разрешим ловушки

loop:   lw      a0 count        # Сюда обработчик запишет текущее время
        li      a7 34           # Выведем его в 16-чном виде
        ecall
        li      a0 '\n'         # И перевод строки
        li      a7 11
        ecall
        b       loop            # sorry, вечный цикл
.data
        .align  2               # Область сохранения контекста
h.save: .space  4               # Пока только t1
.text
handle: csrw    t0 uscratch
        la      t0 h.save
        sw      t1 (t0)         # Сохраняем t0
        lw     t1 count         # Счётчик
        li     t0 1             # Увеличим на 1
        add    t1 t1 t0
        sw     t1 count t0      # Запишем счётчик
        la      t0 h.save
        lw      t1 (t0)         # Восстановим t1
        csrr    t0 uscratch     # восстановим t0
        uret
