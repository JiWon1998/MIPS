.data
	prompt: .asciiz "Enter a number : "
	message : .asciiz "Result : "
.text
.globl main

main:  #int main
	#$t1 : i,  $t2 : n,  $t3 = result

	li $t1, 1 #i=1
	li $t3, 1 # ans = 1

	li $v0,4
	la $a0, prompt 
	syscall #prompt 출력
	
	li $v0,5  #scanf
	syscall
	move $t2, $v0 # n 입력

loop: #for문
	mul $t3,$t3,$t1 #ans = ans*i
		
	beq $t2,0,factorialzero # if (n == 0) factorialzero 호출
	beq $t1, $t2, result # if (i==n) result 호출

	addi $t1, $t1, 1 # i = i+1

	j loop



result:
	
	li $v0,4 
	la $a0, message
	syscall #message 출력

	li $v0,1
	move $a0, $t3
	syscall #result 출력
	
	li $v0, 10
	syscall #종료

factorialzero:
	
	li $v0,4 
	la $a0, message
	syscall #message 출력

	li $v0,1
	addi $t2,$t2,1
	move $a0, $t2
	syscall