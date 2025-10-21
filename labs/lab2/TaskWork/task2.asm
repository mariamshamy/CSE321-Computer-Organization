.data
prompt: .asciiz "Enter n: "
numprom:  .asciiz "Enter the number: "
res: .asciiz "the result=  "

.text
main:
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

    move $t3, $v0             

    addu $t2, $t2, $t3

    addi $t1, $t1, 1
    j for

endLoop:
mtc1 $t0, $f0      # move 7 into floating point register f0
mtc1 $t2, $f2    # move 2 into floating point register f1

cvt.s.w $f0, $f0    # convert integer in f0 to float
cvt.s.w $f2, $f2    # convert integer in f1 to float

div.s $f12, $f2, $f0  # f12 = f0 / f1   (7 ÷ 2 = 3.5)

li $v0,2
syscall

exit:
    li $v0, 10
    syscall