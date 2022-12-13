.text
__start:
.global __start
 la a4, array_length # a4 = длинна массива 
 lw a4, 0(a4)
 la a5, array # a5 = адресс 0ого элемента массива
 li a3, 1 # a3 = 1, счетчик
 addi a6, a5, 4 # a6 = a5 + 4 адрессе[1] элемента массвиа
 lw t0, 0(a5)   # t0 = array[0]
 lw t1, 0(a6)   # t1 = array[1]
 cond:
 bgeu t0, t1, loop1 # если t0 >= t1 -> loop1
 bgeu t1 ,t0, loop2 # если t0 <= t1 -> loop2
 loop1:
 addi t0, t1, 0 #t0 = t1
 jal zero, plus # go to plus
 loop2:
 addi t0, t0, 0 # t0 = t0
 jal zero, plus  # go to plus
 plus:
 addi a3, a3 ,1 # a3++
 bgeu a3, a4 , loop_exit #если а3 >= a4 -> выход
 addi a6, a6, 4 # a6 += 4 [адресс нового элемента]
 lw t1, 0(a6)   # t1 = новый элемент
 jal zero, cond   #go to cond
 loop_exit:
 addi a1, t0, 0 # записываем ответ в а1
 li a0, 24
 ecall          #выводим а1
 li a0, 10
 ecall         #конец работы
 .rodata
 array_length:
 .word 6
 .rodata
 array:
 .word 5, 2, 3, 9, 8, 7
  
 