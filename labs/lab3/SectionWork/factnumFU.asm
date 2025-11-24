.data
prompt: .asciiz "enter num \n"

.text
fact:
    li $t0 ,1      # i
    li $t1 ,1      # fact

for:
    bgt $t0, $a0, endfor
    mul $t1,$t1,$t0
    addi $t0,$t0,1
    j for

endfor:
    move $v0,$t1
    jr $ra


main:
    addi $sp,$sp,-4
    sw $ra, 0($sp)

    li $v0,4
    la $a0,prompt
    syscall

    li $v0,5
    syscall

    move $a0,$v0
    jal fact

    move $a0,$v0
    li $v0,1
    syscall

    lw $ra, 0($sp)
    addi $sp,$sp,4
    
    jr $ra
