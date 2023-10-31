.eqv    BASE 0x10010000
.eqv    WIDTH 512
.eqv    HEIGHT 256

.data   0x10008000
X:      .half 0
Y:      .half 0
Color:  .word 0


.text
dot:    # a0=x a1=y
        sh      a0 X t2
        sh      a1 Y t2
        li      t2  WIDTH
        mul     a1 a1 t2
        add     a0 a0 a1
        slli    a0 a0 2
        lw      a1 Color
        li      t2 BASE
        add     a0 a0 t2
        sw      a1 (a0)
        jr      ra

.macro  push    %r
        addi    sp sp -4
        sw      %r (sp)
.end_macro

.macro  pop     %r
        lw      %r (sp)
        addi    sp sp 4
.end_macro

.eqv	FSIZE	48
.macro  pushs
        addi    sp sp -FSIZE
        sw	ra 4(sp)
	sw	s1 8(sp)
	sw	s2 12(sp)
	sw	s3 16(sp)
	sw	s4 20(sp)
	sw	s5 24(sp)
	sw	s6 28(sp)
	sw	s7 32(sp)
	sw	s8 36(sp)
	sw	s9 40(sp)
	sw	s10 44(sp)
	sw	s11 48(sp)
.end_macro

.macro  pops
	lw	ra 4(sp)
	lw	s1 8(sp)
	lw	s2 12(sp)
	lw	s3 16(sp)
	lw	s4 20(sp)
	lw	s5 24(sp)
	lw	s6 28(sp)
	lw	s7 32(sp)
	lw	s8 36(sp)
	lw	s9 40(sp)
	lw	s10 44(sp)
	lw	s11 48(sp)
        addi	sp sp FSIZE
.end_macro

.macro  subroutine
	push	fp		# Сохраним кадр
	mv	fp sp		# Зададим новый кадр
	addi	sp sp -FSIZE	# Переставляем стек
	pushs
.end_macro

.macro  return
        pops
	mv	sp fp		# Восстанавливаем стек
	pop	fp		# Восстанавливаем предыдущий кадр
	ret
.end_macro

.macro  hrandom %range %var
        li      a0 0
        li      a1 %range
        li      a7 42
        ecall
        sh      a0 %var t2
.end_macro

.macro  abs %dreg %sreg %tmpreg
        li  %tmpreg 0x1f
        sra %tmpreg %sreg %tmpreg
        xor %dreg %tmpreg %sreg
        sub %dreg %dreg %tmpreg
.end_macro
        
        # нарисовать линию от предыдущей точки
        # a0=x1 a1=y1
lineto: subroutine
        lh      s11 X           # X0
        lh      s1 Y            # Y0
        mv      s2 a0           # X1
        mv      s3 a1           # Y1
        sub     s4 s2 s11       # W
        abs     t0 s4 t6
        sub     s5 s3 s1        # H
        abs     t1 s5 t6
        mv      s6 t0           # количество точек N
        bge     t0 t1 xmax
        mv      s6 t1           # это N больше
xmax:   mv      s7 zero         # шаг i
loop:   bgt     s7 s6 done      # Нарисовали X1:Y1?
        # X=X0+W*i/N
        mul     t0 s4 s7
        div     t0 t0 s6
        add     a0 t0 s11       # новый X
        # Y=Y0+H*i/N
        mul     t2 s5 s7
        div     t2 t2 s6
        add     a1 t2 s1        # новый Y
        jal     dot             # поставим точку
        addi    s7 s7 1
        j       loop
done:
        sh      s2 X t2
        sh      s3 Y t2
        return

        # Достаточно яркий случайный цвет
randomcolor:
        li      t0 0
rcnext: li      a0 0            # Цикл по B, G, R
        li      a1 0x10
        li      a7 42
        ecall
        slli     a0 a0 4        # каждый цвет поярче
        la      t2 Color
        add     t2 t2 t0
        sb      a0 (t2)
        addi    t0 t0 1
        li      t2 3
        blt     t0 t2 rcnext
        jr      ra
.data
nx:     .half   0
ny:     .half   0

.text
.globl  main
main:
        hrandom WIDTH X
        hrandom HEIGHT Y

forever:
        jal     randomcolor

        hrandom WIDTH nx
        hrandom HEIGHT ny

        mv      a1 a0
        lh      a0 nx
        jal     lineto
        j       forever

