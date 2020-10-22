.data
	e : .float 2.71828
	pi : .float 3.1415
.text
# Start program execution
	j program
# -----------------------
# Function e ^ 2 / pi implementaion
# $f0 - result
function:
	s.s $f1, 0($sp) # store $f1 register
	l.s $f0, e
	l.s $f1, pi
	mul.s $f0, $f0, $f0
	div.s $f0, $f0, $f1
	l.s $f1, 0($sp) # restore $f1 register
	jr $ra
	
program:
	jal function
	li $v0, 2
	mov.s $f12, $f0
	syscall
	
	li $v0, 10
	syscall