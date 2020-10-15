.data
	func: .asciiz "signum("
	closing: .asciiz ") = "

.text
li $v0, 5 
syscall # read integer
move $t0, $v0 # to the $t0 register

li $v0, 4
la $a0, func
syscall # output "signum("

li $v0, 1
move $a0, $t0
syscall # output inputted parameter

li $v0, 4
la $a0, closing
syscall # output ") = "

beqz $t0, output # if zero, output zero
bgtz $t0, positive # if positive, set to one and output
li $t0, -1
j output
positive:
li $t0, 1
j output

output:
move $a0, $t0
li $v0, 1
syscall

li $v0, 10
syscall