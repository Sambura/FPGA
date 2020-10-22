.data
	startMsg: .asciiz "Enter temperature in Fahrenheit: "
	endMsg: .asciiz "Temperature in Celsius: "
	celsiusDegree: .asciiz " C"
	subtrahend: .float 32.0
	factor: .float 0.55555555555555555555555555555556
.text
# output initial message
	li $v0, 4
	la $a0, startMsg
	syscall 
# ----------------------
# read float value into $f0 register
	li $v0, 6
	syscall
# ----------------------
# calculate result in $f0 register
	l.s $f1, subtrahend
	l.s $f2, factor
	sub.s $f0, $f0, $f1
	mul.s $f0, $f0, $f2
# ----------------------
# output string
	li $v0, 4
	la $a0, endMsg
	syscall
# ----------------------
# output result
	li $v0, 2
	mov.s $f12, $f0
	syscall
# ----------------------
# output degree sign
	li $v0, 4
	la $a0, celsiusDegree
	syscall
# ----------------------
# terminate program
	li $v0, 10
	syscall
