.global _start

.section .data
num1: .word 10  @ First number
num2: .word 20  @ Second number

.section .text
_start:
    LDR R1, =num1  @ Load address of num1 into R1
    LDR R2, [R1]   @ Load the value of num1 into R2

    LDR R3, =num2  @ Load address of num2 into R3
    LDR R4, [R3]   @ Load the value of num2 into R4

    ADD R0, R2, R4 @ Add the values of R2 and R4 and store in R0

    @ Exit the program (assuming you are on a Linux system or an ARM emulator)
    MOV R7, #1     @ syscall number for exit
    SVC #0
