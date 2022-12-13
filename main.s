.text
__start:
.global __start
 call Main
 finish:
 mv a1, a0
 li a0, 17
 ecall
 
 .text
 Main:
 la a0, array
 lw a3, array_length
 addi sp, sp, -16     # выделение памяти в стеке, убираем зацикливание
 sw ra, 12(sp)        # сохранение ra
 call Min         # вызлв программы min
 lw ra, 12(sp)     # восстановление ra
 addi sp, sp 16   # освобождение памяти в стеке, убираем зациклиивание
 li a0, 24
 ecall            #выводим а0
 ret               
 .rodata
 array_length:
 .word 6
 .rodata
 array:
 .word 5, 2, 3, 1, 8, 7