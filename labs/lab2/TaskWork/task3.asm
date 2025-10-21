.data

prompt1:    .asciiz "Enter the number: "
promot2:    .asciiz "Enter \n 0 to decrease number by 1 \n 1 ro increase number by 1 "
newLine: .asciiz "\n"

.text

main:
li $v0,4
la $a0,prompt1
syscall

li $v0,5
syscall
move $t0,$v0 

li $v0,4
la $a0,promot2
syscall

li $v0,5
syscall
move $t1,$v0 

li $t2,1      

j switch

switch:

beq $t1,$zero,case1
beq $t1,1 ,case2
j default

case1:
    subu $t0,$t0,$t2
    j breakcase

case2:
    addu $t0,$t0,$t2
    j breakcase

default:
    j breakcase

breakcase:   
    move $a0,$t0 
    li $v0, 1
    syscall
    
    li $v0,4
    la $a0,newLine
    syscall

exit:
li $v0,10
syscall