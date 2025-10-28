.data
program: .asciiz "Enter n integers and get the average!!\n"
prompt: .asciiz "Enter n: "
numprom:  .asciiz "Enter the number: "
res: .asciiz "the average=  "
newLine: .asciiz "\n "

.text
main:
    li $v0, 4
    la $a0, program
    syscall

li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall 

move $t0, $v0                  #n
addi $t1, $zero, 1      # $t1 <- i

move $t2, $zero                #sum

for:
    bgt $t1, $t0, endLoop

    li $v0, 4
    la $a0, numprom
    syscall

    li $v0, 5
    syscall

    addu $t2, $t2, $v0

    addi $t1, $t1, 1

    j for

endLoop:

divu $t2,$t0

    li $v0, 4
    la $a0, res
    syscall

mflo $a0

    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

exit:
    li $v0, 10
    syscall