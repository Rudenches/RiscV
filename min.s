.text
 Min:
 .global Min
 li a2, 1          #a2 = 1
 addi a4, a0, 4    # a4 = a0 + 4 адрессе[1] элемента массвиа
 lw t0, 0(a0)      # t0 = array[0]
 lw t1, 0(a4)      # t1 = array[1]
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
 addi a2, a2, 1  # a2++
 bgeu a2, a3, loop_exit   #если а2 >= a3 -> выход
 addi a4, a4, 4           # a4 += 4 [адресс нового элемента]
 lw t1, 0(a4)             # t1 = новый элемент
 jal zero cond            # go to cond
 loop_exit:
 addi a1, t0, 0           # a1 -> ответ
 ret