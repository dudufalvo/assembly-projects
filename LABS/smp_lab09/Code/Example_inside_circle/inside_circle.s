# demo stack frame usage w/ a saved register [non-leaf procedure]
.data

.text
.globl inside_cicle

# C function prototype: int inside_cicle(int x, int y, int radius);
# input parameters: $a0 (x), $a1 (y), $a2 (radius)
# return parameter: $v0 (1 true) (0 false)
#
# - a point (x,y) is inside circle if: x^2 + y^2 <= radius^2
# - this function will call 3 times a non-leaf procedure to compute the squared terms

inside_cicle:

    ## Argument section
    # save/backup input arguments in caller's (main) stack frame
    # the caller always reserve space, in its own stack, for the input args of the callee
    sw $a0, 0($sp)      # save arg0 (x) at offset 0 bytes
    sw $a1, 4($sp)      # save arg1 (y) at offset 4 bytes
    sw $a2, 8($sp)      # save arg2 (radius) at offset 8 bytes

    ## Prologue
    ## set callee stack
    addiu	$sp, $sp, -16   # reserve stack frame (16 bytes)
    # empty slot at offset $sp + 12 bytes (not used)
    sw $ra, 8($sp)        # save return address ($ra) at offset 8 bytes
    sw $s0, 4($sp)        # save saved register s0 ($s0) at offset 4 bytes
    # reserve 4 bytes for 1 argument ($a0), required by the convention


    # move $a0, $a0       # $a0 = x (already set)
    jal squared           # call leaf procedure: compute x^2
    nop                   # delay slot
    move $s0, $v0         # copy $s0 = $v0 = x^2

    move $a0, $a1         # $a0 = y
    jal squared           # call leaf procedure: compute y^2
    nop                   # delay slot
    add $s0, $s0, $v0     # $s0 = $s0 + $v0 = x^2 + y^2

    move $a0, $a2         # $a0 = radius
    jal squared           # call leaf procedure: compute radius^2
    nop                   # delay slot
                          # $v0 = radius^2

    # if (x^2 + y^2 <= radius^2) return 1; else return 0;
    ble $s0, $v0, L1      # if( $s0 <= $v0 ) branch to L1
    # here: ($s0 > $v0)
    li $v0, 0             # set return value = 0 (false)
    j L2                  # required to jump over L1 section
L1:
    # here: ($s0 <= $v0)
    li $v0, 1             # set return value = 1 (true)
L2:


    # note: if required, we can recover the original input arguments by:
    # lw $a0, 16($sp)     # recover arg0 (x) (at stack offset 16 + 0 bytes)
    # lw $a1, 20($sp)     # recover arg1 (y) (at stack offset 16 + 4 bytes)
    # lw $a2, 24($sp)     # recover arg2 (radius) (at stack offset 16 + 8 bytes)

    ## Epilogue
    ## recover stack data and clear
    lw $s0, 4($sp)        # restore $s0 (all saved registers used must be preserved)
    lw $ra, 8($sp)        # restore return address ($ra)
    addiu	$sp, $sp, 16    # free stack

                          # $v0 holds the desired return value
    jr $ra                # jump to caller



# int squared (int z){ return z^2 }
squared:
                        # leaf procedure, stack not required
  mul $v0, $a0, $a0     # compute $v0 = $a0^2   (multiplication w/o overflow)
  jr $ra                # jump to caller
