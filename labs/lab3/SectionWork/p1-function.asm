add_func:
    # uses t0,$s0      
    # addi $sp, $sp, -4    saved s0
    # sw   $s0, 0($sp)  



    #addi $sp, $sp, -4         #ashan aryah demaghy 1 #save snd restore is there is use for s0
    #sw   $ra, 0($sp)

    add $v0, $a0, $a1

    #ashan aryah demaghy 2
    #but we dont need these two lines 'Leave function'
    #lw   $ra, 0($sp)
    #addi $sp, $sp, 4

    # lw   $s0, 0($sp)    restored s0
    # addi $sp, $sp, 4 

    jr $ra

main:
    addi $sp, $sp, -4    #allocate 4bytes --> 32 bit reg $ra
    sw   $ra, 0($sp)     #kda ana hafezt ala elvalue ra

    li  $a0, 5
    li  $a1, 7

    # $t0 =10        must be saved by main 'caller' at stack
    # $s0 =11        must be saved by callee ..> can print it no problem
    # addi $sp, $sp, -4    saved t0
    # sw   $t0, 0($sp)  

    jal add_func

    # lw   $t0, 0($sp)    restored t0
    # addi $sp, $sp, 4    

    move $t0, $v0

returnMain:
    lw   $ra, 0($sp)    #get value of address of ra
    addi $sp, $sp, 4    #deallocate
    jr $ra
 
