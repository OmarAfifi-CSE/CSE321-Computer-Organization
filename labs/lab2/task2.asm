    # Write an assembly language program using MIPS architecture to enter n integers from user and
    # determine and display the average of n numbers where number of integer n is entered by user. Program
    # should include prompt message for user inputs and appropriate message for displayed result.


.data
prompt_n:   .asciiz "How many numbers do you want to average?: "
prompt_num: .asciiz "Enter number: "
result_msg: .asciiz "\nThe average is: "
exit_msg:   .asciiz "No numbers entered. Exiting.\n"
newline:    .asciiz "\n"


.text
main:
    li      $v0,        4
    la      $a0,        prompt_n
    syscall
    li      $v0,        5
    syscall
    move    $t0,        $v0
    beq     $t0,        $zero,      exit_safe
    # ------------------------------------------------
    li      $t1,        0                                           # Initialize sum to 0
    li      $t2,        0                                           # Initialize counter to 0
loop_start:
    bge     $t2,        $t0,        loop_end                        # If counter == n, exit loop
    li      $v0,        4
    la      $a0,        prompt_num
    syscall
    li      $v0,        5
    syscall
    add     $t1,        $t1,        $v0                             # Add input to sum
    addi    $t2,        $t2,        1                               # counter++
    j       loop_start
loop_end:
    li      $v0,        4
    la      $a0,        result_msg
    syscall
    div     $a0,        $t1,        $t2
    li      $v0,        1
    syscall
    li      $v0,        4
    la      $a0,        newline
    syscall

exit:
    li      $v0,        10
    syscall

exit_safe:
    li      $v0,        4
    la      $a0,        exit_msg
    syscall
    j       exit