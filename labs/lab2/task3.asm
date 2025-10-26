    # Write an assembly language program using MIPS architecture to implement switch...case
.data
prompt:         .asciiz "Enter a number (1-3): "
case1_msg:      .asciiz "الواحد واقف مظبوط\n"
case2_msg:      .asciiz "والاتنين بتبص عليه\n"
case3_msg:      .asciiz "والتلاتة بسنتين\n"
default_msg:    .asciiz "مش لاعب\n"


.text
main:
    li      $v0,            4
    la      $a0,            prompt
    syscall
    li      $v0,            5
    syscall
    move    $t0,            $v0
    # -----------------------------
    beq     $t0,            1,              case1
    beq     $t0,            2,              case2
    beq     $t0,            3,              case3
    j       default_case


case1:
    li      $v0,            4
    la      $a0,            case1_msg
    syscall
    j       main

case2:
    li      $v0,            4
    la      $a0,            case2_msg
    syscall
    j       main

case3:
    li      $v0,            4
    la      $a0,            case3_msg
    syscall
    j       main

default_case:
    li      $v0,            4
    la      $a0,            default_msg
    syscall

exit:
    li      $v0,            10
    syscall
