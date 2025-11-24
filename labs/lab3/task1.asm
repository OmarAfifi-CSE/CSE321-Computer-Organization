.data
prompt:     .asciiz "Enter a number: "
result_msg: .asciiz "The Fibonacci number is: "
newline:    .asciiz "\n"

.text
main:
    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)
    # 1. Print prompt
    addi    $v0,        $zero,      4
    la      $a0,        prompt
    syscall
    # 2. Read integer from user
    addi    $v0,        $zero,      5
    syscall
    add     $a0,        $zero,      $v0

    # 3. Call Fibonacci function
    jal     fibonacci
    move    $s1,        $v0

    # 4. Print result message
    addi    $v0,        $zero,      4
    la      $a0,        result_msg
    syscall

    # 5. Print the calculated number
    move    $a0,        $s1
    addi    $v0,        $zero,      1
    syscall

    # 6. Print newline
    addi    $v0,        $zero,      4
    la      $a0,        newline
    syscall

    # 7. Exit program
    lw      $ra,        0($sp)
    jr      $ra

    # ------------------------------------------------------------------
    # Function: fibonacci
    # Arguments: $a0 = n
    # Returns:   $v0 = fib(n)
    # Logic:     Recursive: fib(n) = fib(n-1) + fib(n-2)
    # Base keys: fib(0)=0, fib(1)=1
    # ------------------------------------------------------------------
fibonacci:
    # If n <= 0, return 0
    slt     $t0,        $zero,      $a0
    beq     $t0,        $zero,      return_zero

    # If n == 1, return 1
    addi    $t1,        $zero,      1
    beq     $a0,        $t1,        return_one

    # Recursive: fib(n) = fib(n-1) + fib(n-2)
    addi    $sp,        $sp,        -12
    sw      $ra,        0($sp)
    sw      $a0,        4($sp)

    addi    $a0,        $a0,        -1
    jal     fibonacci
    sw      $v0,        8($sp)

    lw      $a0,        4($sp)
    addi    $a0,        $a0,        -2
    jal     fibonacci


    lw      $t2,        8($sp)
    add     $v0,        $v0,        $t2         # fib(n-2) + fib(n-1)

    # Exit fibonacci
    lw      $ra,        0($sp)
    addi    $sp,        $sp,        12
    jr      $ra


return_zero:
    add     $v0,        $zero,      $zero
    jr      $ra

return_one:
    addi    $v0,        $zero,      1
    jr      $ra