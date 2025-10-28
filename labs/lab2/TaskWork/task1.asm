.data
program: .asciiz "Enter four integers and get the average!!\n"
fnp: .asciiz "Enter number: "
res: .asciiz "the average=  "
newLine: .asciiz "\n "

.text
main:
    li $v0, 4
    la $a0, program
    syscall

    li $t1, 4           # $t0 <- 4
    
    addi $t2, $zero, 1      # $t1 <- i
    move $t0, $zero         # $t2 <- sum

for:
    bgt $t2, $t1, endfor

li $v0,4
la $a0,fnp
syscall

li $v0,5
syscall 

add $t0,$t0,$v0
addi $t2,$t2,1

    j for

endfor:
div $t3,$t0,$t1

    li $v0, 4
    la $a0, res
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, newLine
    syscall

exit:
li $v0,10
syscall
