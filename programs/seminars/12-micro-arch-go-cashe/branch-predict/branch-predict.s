.data
.eqv    GAP     68
start:  .space  1024
end:
.text
        la      s2 end
        li      s3 GAP
        li      s4 0
loop:   la      s1 start
        add     s1 s1 s4
loopi:  lw      t0 (s1)
        add     s1 s1 s3
        blt     s1 s2 loopi
        addi    s4 s4 4
        blt     s4 s3 loop
