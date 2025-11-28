.data
A:      .word   4
B:      .word   6
msg:    .asciiz "The result is: "
msg_s0: .asciiz "\nValue of $s0 (should be 99): "

.text

    # ===========================
    # Function: compute(a, b)
    # returns (a + b) * 2
    # ===========================
compute:
    # TODO: Callee-save step (allocate stack)
    addi    $sp,        $sp,    -4
    sw      $s0,        0($sp)

    add     $s0,        $a0,    $a1                 # s0 = a + b
    sll     $v0,        $s0,    1                   # v0 = s0 * 2

    # TODO: Callee-restore step
    lw      $s0,        0($sp)
    addi    $sp,        $sp,    4

    jr      $ra


    # ===========================
    # main function (caller)
    # ===========================
main:
    lw      $t0,        A
    lw      $t1,        B
    li      $s0,        99                          # We set s0 to 99 to prove 'compute' doesn't break it

    # TODO: Caller-save step
    addi    $sp,        $sp,    -12
    sw      $ra,        0($sp)
    sw      $t0,        4($sp)
    sw      $t1,        8($sp)

    move    $a0,        $t0
    move    $a1,        $t1
    jal     compute

    move    $t3,        $v0                         # Move result to t3

    # TODO: Caller-restore step
    lw      $ra,        0($sp)
    lw      $t0,        4($sp)
    lw      $t1,        8($sp)
    addi    $sp,        $sp,    12

    # Print Calculation
    li      $v0,        4
    la      $a0,        msg
    syscall
    li      $v0,        1
    move    $a0,        $t3
    syscall

    # Print $s0 to prove it was restored
    li      $v0,        4
    la      $a0,        msg_s0
    syscall

    li      $v0,        1
    move    $a0,        $s0
    syscall

    jr      $ra