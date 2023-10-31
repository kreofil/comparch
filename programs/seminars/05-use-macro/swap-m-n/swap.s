#
# Example: function what swaps two values passed to in the stack.
#
.include "macrolib.s"
main:
    la   t0, n
    lw	 t2, (t0)
    la   t1, m
    lw	 t3, (t1)
    sw   t2, (t1)
    sw   t3, (t0)
    
    exit
