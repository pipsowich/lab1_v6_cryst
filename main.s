.data
    matrix: .word 10, 22, 33, 4, 52, 64, 17, 8, 91, 10, 111, 3, 1, 14, 52, 31
    N: .word 4
    M: .word 4

.text
.globl main

main:

    lw a0, N
    lw a1, M
    la a2, matrix

    jal ra, sum_array

    mv a1, a0
    li a0, 1
    ecall

    li a0, 10
    ecall

sum_array:

    addi sp, sp, -12
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)

    mv s0, zero
    mv s1, zero
    mv s2, zero

    mv t0, a0
    mv t1, a1
    mv t2, a2

outer_loop:
    bge s0, t0, end_outer
    mv s1, zero

inner_loop:
    bge s1, t1, end_inner

    mul t3, s0, t1
    add t3, t3, s1
    slli t3, t3, 2
    add t4, t2, t3

    lw t5, 0(t4)
    add s2, s2, t5

    addi s1, s1, 1
    j inner_loop

end_inner:
    addi s0, s0, 1
    j outer_loop
end_outer:
    mv a0, s2

    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12

    jalr zero, ra, 0
