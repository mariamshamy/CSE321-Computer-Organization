.data
name: .asciiz "name: mariam elshamy   \n"
id: .asciiz "ID: 20812022200580    \n"
course: .asciiz "Course: CSE321-computer-organization  \n"

.text

main:
li $v0,4
la $a0,name
syscall

la $a0,id
syscall

la $a0,course
syscall

li $v0,10
syscall