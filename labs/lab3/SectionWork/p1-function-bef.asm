add_func:
    add $v0, $a0, $a1
    jr $ra

main:
    
    li  $a0, 5
    li  $a1, 7

    jal add_func

    move $a0, $v0

    li $v0,1
    syscall

#no need for exit: becouse of:
returnMain:
    jr $ra  #msh ha3raf arga3lo tany 'add-fun will override it' ---? another problem sol-->edit 1