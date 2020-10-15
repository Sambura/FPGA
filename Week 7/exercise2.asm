.data
	buffer: .space 200
	msg: .asciiz "Words count: "
.text

li $v0, 8
la $a0, buffer
li $a1, 199
syscall

li $t0, 0 # words counter
la $t1, buffer # char address
li $t3, 0 # was word couted

iter:

lb $t2, ($t1) # get char from memory
addi $t1, $t1, 1 # increase memory address

beq $t2, 0, exit # if null terminator, break loop
beq $t2, 10, exit # if \n, break loop

beq $t2, 32, space # if space, jump to space
# else - char
bnez $t3, iter # if word was already counted, continue
# else - count
addi $t0, $t0, 1 # increase word counter
li $t3, 1 # set word flag
j iter # continue

space: # reset word flag & continue
li $t3, 0
j iter

exit:

li $v0, 4
la $a0, msg
syscall

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall