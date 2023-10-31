.text
.macro  printx  %char # число для вывода уже в a0
        li      a7 34
        ecall
        li      a0 %char
        li      a7 11
        ecall
.end_macro

.globl main
main:   la      t0 handle       # Устанавливаем обработчик
        csrw    t0 utvec
        csrsi   uie 0x101       # Включаем программные и внешние прерывания
        li      a0 2            # Включаем прерывание от клавиатуры
        sw      a0 0xffff0000 t0
        csrsi   ustatus 1       # Разрешаем обработку прерываний

here:   csrsi   uip 1           # Вызываем программное прерывание
        lw      a0 (gp)         # Смотрим, были ли отложенные прерывания
        beqz    a0 here
        printx  ':'             # Выводим uip
        lw      a0 4(gp)
        printx  '\n'            # Выводим ustatus
        sw      zero (gp)       # Затираем сведения
        b       here

.data
h.t1:   .word 0
.text
handle: csrw    t0 uscratch
        csrr    t0 uip          # проверим отложенные прерывания
        beqz    t0 h.noip       # если были
        sw      t0 (gp)         # запомним, какие (uip)
        csrr    t0 ucause       
        sw      t0 4(gp)        # и какой был ucause
h.noip: csrr    t0 uscratch
        uret
