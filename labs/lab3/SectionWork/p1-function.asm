add_func:
#4-------------resonsebility of callee
#save snd restore if there is use for s0
    # uses t0,$s0     

    # addi $sp, $sp, -4    saved s0
    # sw   $s0, 0($sp)  


#2------- ashan aryah demaghy 1 
    #addi $sp, $sp, -4         
    #sw   $ra, 0($sp)

    add $v0, $a0, $a1

#2---------ashan aryah demaghy 2
    #but we dont need these two lines 'Leave function'
    #lw   $ra, 0($sp)
    #addi $sp, $sp, 4

    # lw   $s0, 0($sp)    restored s0
    # addi $sp, $sp, 4 

    jr $ra

main:
#1------------- edit
    addi $sp, $sp, -4    #allocate 4bytes --> 32 bit reg $ra 
    sw   $ra, 0($sp)     #kda ana hafezt ala elvalue ra at stack so i can return to it 

    li  $a0, 5
    li  $a1, 7
#3----------resonsebility og main
    # $t0 =10        must be saved by main 'caller' at stack
    # $s0 =11        must be saved by callee ..> can print it no problem

    # addi $sp, $sp, -4    saved t0
    # sw   $t0, 0($sp)  

    jal add_func

    # lw   $t0, 0($sp)    restored t0
    # addi $sp, $sp, 4    

    move $t0, $v0

returnMain:
#cont 1---------------- edit
    lw   $ra, 0($sp)    #get value of address of ra
    addi $sp, $sp, 4    #deallocate
    jr $ra
 
