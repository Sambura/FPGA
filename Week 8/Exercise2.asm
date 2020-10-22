.text

j program
# $a0 = argument
# $v0 = return
addnumbers:
	subi $sp, $sp, 8
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	
	li $v0, 1
	beq $a0, 1, exitRec
	
	move $t0, $a0
	sub $a0, $a0, 1
	
	jal addnumbers
	
	add $v0, $v0, $t0
	
exitRec:
	lw $ra, 0($sp)
	lw $t0, 4($sp)
	add $sp, $sp, 8
	jr $ra

program:
	li $v0, 5
	syscall
	
	move $a0, $v0
	
	jal addnumbers
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
