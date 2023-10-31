.text
.globl main
main:   la      t0 handle
        csrw    t0 utvec
        csrsi   uie 0x100
        csrsi   ustatus 1              # enable all interrupts

        li      a0 2                   # enable keyboard
        sw      a0 0xffff0000 t0

here:   jal     sleep
        lw      a0 (gp)                # print key stored in (gp)
        li      t0 0x1b
        beq     a0 t0 done             # ESC terminates
        beqz    a0 here                # No input
        li      a7 1
        ecall
        li      a0 '\n'
        li      a7 11
        ecall
        sw      zero (gp)              # Clear input
        b       here
done:   li      a7 10
        ecall

.eqv    ZZZ     1000
sleep:  li      t0 ZZZ                 # Do nothing
tormo0: addi    t0 t0 -1
        blez    t0 tormo1
        b       tormo0
tormo1: ret

handle: csrw    t0 uscratch
        sw      a7 sr1  t0            # We need to use these registers
        sw      a0 sr2  t0            # not using the stack

        csrr    a0 ucause             # Cause register
        srli    a0 a0 31              # Get interrupt bit
        beqz    a0 hexc               # It was an exception
                                      # Assume only I/O interrupts enables
        lw      a0 0xffff0004         # get the input key
        sw      a0 (gp)               # store key
        li      a0 '.'                # Show that we handled the interrupt
        li      a7 11
        ecall
        b       hdone

hexc:   csrr    a7 uepc               # No exceptions in the program, but just in case of one
        addi    a7 a7 4               # Return to next instruction
        csrw    a7 uepc

hdone:  lw      a7 sr1                # Restore other registers
        lw      a0 sr2
        csrr    t0 uscratch
        uret

.data
sr1:     .word 10
sr2:     .word 11
