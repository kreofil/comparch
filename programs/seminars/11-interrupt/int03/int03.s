.text
.globl main
main:   la      t0 handle
        csrw    t0 utvec            # Ловушка
        csrsi   uie 0x101           # Обработка внешних и программных прерываний
        li      t1 3
        sw      t1 0xffff0008 t0    # Прерывание готовности вывода и «reset»
        csrsi   ustatus 1           # Разрешение обработки

        li      s1 27               # ESC
loop:   lb      t0 0xffff0000       # готовность ввода
        andi    t0 t0 1             # если нет,
        beqz    t0 loop             # ждём дальше
        lb      t0 0xffff0004       # введём байт
        beq     t0 s1 done          # ESC
        sb      t0 stdout t1        # заполним буфер
        csrsi   uip 1               # Программное прерывание
        b       loop
done:   li      a7 10
        ecall
        
.data
stdout: .word   0
h.t1:   .word   0
.text
handle: csrw    t0 uscratch         # сохраним t0
        sw      t1 h.t1 t0          # сохраним t1
        csrr    t0 ucause           # рассмотрим тип прерывания
        andi    t0 t0 0x100         # Внешнее?
        bnez    t0 h.out            # не глядя считаем, что готовность вывода
h.soft: lw      t0 0xffff0008       # не глядя считаем, что программное
        andi    t0 t0 1             # смотрим готовность
        beqz    t0 h.exit           # нет? потом выведем!
h.out:  lw      t0 stdout           # готовность есть (по прерыванию или по проверке)
        beqz    t0 h.exit           # но буфер пуст, нисчего не делаем
        sw      t0 0xffff000c t1    # иначе записываем его
        sw      zero stdout t1      # очищаем буфер
h.exit: lw      t1 h.t1             # вспоминаем t1
        csrr    t0 uscratch         # вспоминаем t0
        uret
