.text              
.globl _start
// start code here
_start:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial
    la t1, a
    sw a0, 0(t1)
    j write_tohost


factorial:
    # YOUR CODE HERE
    addi sp,sp,-8
    sw s0, 0(sp)
	sw ra, 4(sp)
	mv s0, a0
    li t0,1
    ble a0,t0,done
    addi a0,a0,-1
    jal factorial
    mul a0,a0,s0
    j end
    
    done:
    mv a0,t0
    j end
    
    end:
    lw s0,0(sp)
    lw ra, 4(sp)
    addi sp,sp,8
    jr ra
// end code here

write_tohost:

li x1, 1

sw x1, tohost, t5

j write_tohost

.data 

// start data section here
n: .word 8
a: .word 0
// end data section here

.align 12

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0; 

