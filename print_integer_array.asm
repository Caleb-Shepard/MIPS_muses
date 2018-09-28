# **************************************************************************** #
#                                                                              #
#                                                             |\               #
#    print_integer_array.asm                            ------| \----          #
#                                                       |    \`  \  |  p       #
#    By: cshepard6055 <cshepard6055@floridapoly.edu>    |  \`-\   \ |  o       #
#                                                       |---\  \   `|  l       #
#    Created: 2018/09/28 08:10:03 by cshepard6055       | ` .\  \   |  y       #
#    Updated: 2018/09/28 08:36:56 by cshepard6055       -------------          #
#                                                                              #
# **************************************************************************** #

.data
integer_list:   .word 10,25,5,1
size:           .word 4

.text
la $a1, integer_list
lw $a0, size

jal print_list

# exit instruction
li $v0, 10
syscall

# print_integer_list(int *integer_list)
# function print to print an array of numbers
print_list
.data
space: .asciiz " "
.text
move $t3, $a0       # maximum count
li $t2, 0           # index i = 0
move $t1, $a1       # get the address of the array

loop:
beq $t2, $t3, label

# printf("%d", array[i]);
# print the number at array[i]
lw $a0, 0($t1)
li $v0, 1
syscall

# printf("%c", ' ');
# print space " "
la $a0, space
li $v0, 4
syscall

addi $t2, $t2, 1    #increment loop counter 1
addi $t1, $t1, 4    # since MIPS has an integer width of 4, we increment by 4

j loop              # loop back to print numbers until maximum index

label: 
# end of loop and return from function print
jr $ra

# implied exit, EOF reached
