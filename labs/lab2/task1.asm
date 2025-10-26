    #  Write an assembly language program using MIPS architecture to enter four integers from user and
    #  determine and display the average of four numbers. Program should include prompt message for user inputs
    #  and appropriate message for displayed result.

.data
enterFirstNum:  .asciiz "Enter first number: "
enterSecondNum: .asciiz "Enter second number: "
enterThirdNum:  .asciiz "Enter third number: "
enterFourthNum: .asciiz "Enter fourth number: "
resultMsg:      .asciiz "The average of the four numbers is: "
newline:        .asciiz "\n"


.text
main:
    li      $v0,    4
    la      $a0,    enterFirstNum
    syscall
    li      $v0,    5
    syscall
    move    $t0,    $v0
    # ------------------------------------------------
    li      $v0,    4
    la      $a0,    enterSecondNum
    syscall
    li      $v0,    5
    syscall
    move    $t1,    $v0
    # ------------------------------------------------
    li      $v0,    4
    la      $a0,    enterThirdNum
    syscall
    li      $v0,    5
    syscall
    move    $t2,    $v0
    # ------------------------------------------------
    li      $v0,    4
    la      $a0,    enterFourthNum
    syscall
    li      $v0,    5
    syscall
    move    $t3,    $v0
    # ------------------------------------------------
    li      $v0,    4
    la      $a0,    resultMsg
    syscall

    # Calculate the average
    add     $t4,    $t0,            $t1
    add     $t4,    $t4,            $t2
    add     $t4,    $t4,            $t3
    li      $t5,    4
    div     $a0,    $t4,            $t5
    li      $v0,    1
    syscall

    # Print newline
    li      $v0,    4
    la      $a0,    newline
    syscall

exit:
    li      $v0,    10
    syscall