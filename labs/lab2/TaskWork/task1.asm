.data
fnp: .asciiz "Enter the first number: "
snp: .asciiz "Enter the second number: "
tnp: .asciiz "Enter the third number: "
fonp: .asciiz "Enter the fourth number: "
res: .asciiz "the result=  "

.text
main:
li $v0,4
la $a0,fnp
syscall

li $v0,5
syscall 
move $t0, $v0

li $v0,4
la $a0,snp
syscall

li $v0,5
syscall 
move $t1, $v0

li $v0,4
la $a0,tnp
syscall

li $v0,5
syscall 
move $t2, $v0

li $v0,4
la $a0,fonp
syscall

li $v0,5
syscall 
move $t3, $v0

li $v0,4
la $a0,res
syscall

addu $t4, $t0 ,$t1
addu $t5, $t4 ,$t2
addu $a0, $t5 ,$t3

li $t6,4  

mtc1 $a0, $f0      # move 7 into floating point register f0
mtc1 $t6, $f1      # move 2 into floating point register f1

cvt.s.w $f0, $f0    # convert integer in f0 to float
cvt.s.w $f1, $f1    # convert integer in f1 to float

div.s $f12, $f0, $f1  # f2 = f0 / f1   (7 ÷ 2 = 3.5)

li $v0,2
syscall

exit:
li $v0,10
syscall
