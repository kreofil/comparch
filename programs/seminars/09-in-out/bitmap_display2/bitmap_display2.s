.eqv    ALLSIZE 0x20000                 # размер экрана в ячейках
.eqv    BASE    0x10040000              # MMIO экрана
.data   BASE
screen:
.text
again:  li      a7 9
        li      a0 100
        ecall
        mv      a0 zero
        li      a1 ALLSIZE              # Максимальное 512*Y+X + 1
        li      a7 42
        ecall                           # Случайное 512*Y+X
        slli    t2 a0 2                 # Домножаем на 4
        mv      a0 zero
        li      a1 0x1000000            # Максимальный RGB-цвет + 1
        li      a7 42
        ecall
        la      t0 screen
        add     t2 t2 t0                # Случайный цвет
        sw      a0 (t2)
        b       again
