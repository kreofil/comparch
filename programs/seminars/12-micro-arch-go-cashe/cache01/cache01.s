.data
start:  .space 1024
end:
.text
        la      s1 start
        la      s2 end
loop:   lw      t0 (s1)
        addi    s1 s1 4
        blt     s1 s2 loop
