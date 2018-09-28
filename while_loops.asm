# **************************************************************************** #
#                                                                              #
#                                                             |\               #
#    while_loops.asm                                    ------| \----          #
#                                                       |    \`  \  |  p       #
#    By: cshepard6055 <cshepard6055@floridapoly.edu>    |  \`-\   \ |  o       #
#                                                       |---\  \   `|  l       #
#    Created: 2018/09/19 08:41:34 by cshepard6055       | ` .\  \   |  y       #
#    Updated: 2018/09/28 08:50:19 by cshepard6055       -------------          #
#                                                                              #
# **************************************************************************** #

# C representation

#int pow = 1;
#int x = 0;

#while (pow != 128) {
#   pow = pow * 2;
#   x = x + 1;
#}


# MIPS Representation
$s0 = pow, $s1 = x
    addi $s0, $0, 1
    add $s1, $0, $0
    addi $t0, $0, 128
while: beq $s0, $t0, done
    sll $s0, $s0, 1
    addi $s1, $s1, 1
    j while
done:

# It's also possible to use the move instruction rather than the add instruction
