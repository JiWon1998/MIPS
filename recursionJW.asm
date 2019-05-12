.data
	prompt: .asciiz "Enter a number: "
	message: .asciiz "Result : "
.text
.globl main

main: #int main
	#$t1 = i, $t2(0!,1!계산) = 1, $t3 = result

	li $t3, 1 #결과의 초기값 = 1
	li $t2, 1

	 #prompt 출력
	li$v0,4
	la $a0, prompt
	syscall

	 #scanf
	li $v0, 5
	syscall
	move $t1, $v0
	
	beq $t1,0,return1 #if ($t1==0) goto return1
	beq $t1,$t2,return1 #if($t1==$t2) goto return1
	jal recursive #goto recursive

	 #message 출력
	li $v0,4 
	la $a0, message
	syscall

	 #$t3 출력
	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 10
	syscall

return1:

	li $v0,4 
	la $a0, message
	syscall

	li $v0,1
	move $a0, $t2
	syscall

recursive:	
	mul $t3,$t3,$t1
	sub $t1,$t1,1
	bne $t1,1,recursive
	jr $ra
