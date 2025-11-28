.data
A:  .word 4
B:  .word 6
prom1: .asciiz "---compute output: \n"
prom2: .asciiz "\n---s0 did not affected by using it in callee ! \n"

.text

# ===========================
# Function: compute(a, b)
# returns (a + b) * 2
# ===========================
compute:
    # TODO: Callee-save step (allocate stack)
    addi $sp, $sp, -4
    sw   $s0, 0($sp)

    add  $s0, $a0, $a1      # s0 = a + b
    sll  $v0, $s0, 1        # v0 = s0 * 2

    # TODO: Callee-restore step
    lw   $s0, 0($sp)
    addi $sp, $sp, 4

    jr   $ra


# ===========================
# main function (caller)
# ===========================
main:
    lw   $t0, A
    lw   $t1, B
    li   $s0, 99

    # TODO: Caller-save step

    addi $sp, $sp, -4
    sw   $ra, 0($sp)
    #--- if the callee fun "compute" was using t0 or t1 then these steps was needed
    #addi $sp, $sp, -4
    #sw   $t0, 0($sp)
    #addi $sp, $sp, -4
    #sw   $t1, 0($sp)
  
    move $a0, $t0
    move $a1, $t1

    jal  compute

    move $t3, $v0
   
    #to test if everthing gone ok..
    
    li $v0,4 
    la $a0,prom1
    syscall

    li $v0,1
    move $a0,$t3
    syscall 

    li $v0,4 
    la $a0,prom2
    syscall
    
    li $v0,1
    move $a0,$s0
    syscall 

    # TODO: Caller-restore step

    #----- deallocate t1,t0 
    #lw   $t1, 0($sp)
    #lw   $t0, 4($sp)
    #addi $sp, $sp, 8

    lw   $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra