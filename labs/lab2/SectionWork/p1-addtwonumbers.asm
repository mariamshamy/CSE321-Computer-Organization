.data
fnp: .asciiz "Enter the first number: "
snp: .asciiz "Enter the second number: "
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
la $a0,res
syscall

addu $a0, $t0 ,$t1 #more safe no overflow trap 

li $v0,1
syscall

exit:
li $v0,10
syscall
