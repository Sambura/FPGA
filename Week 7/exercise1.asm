.text
li $v0, 5
syscall
beqz $v0, output
bgtz $v0, positive
li $v0, -1
j output
positive:
li $v0, 1
j output
output:
move $a0, $v0
li $v0, 1
syscall
li $v0, 10
syscall