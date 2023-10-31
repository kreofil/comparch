.data
start:  .space 512
middle: .space 512
end:
.text
        la      s1 start
        la      s3 middle
        la      s2 end
loop:   lw      t0 (s1)
        lw      t1 (s3)
        addi    s1 s1 4
        addi    s3 s3 4
        blt     s3 s2 loop
