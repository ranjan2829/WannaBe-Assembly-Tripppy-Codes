.global _main
.align 2

.text
_main:

//setup main frame
    stp x29,x30,[sp,#-16]!
    mov x29,sp
    //load numbers

    mov w0,#28
    mov w1,#2

    //adding
    add w2,w0,w1


    //address to the register

    adrp x0,result_message@PAGE
    add x0,x0,result_message@PAGEOFF
    mov x1,x2
    bl printf




    // return
    mov w0,#0
    ldp x29,x30,[sp],#16
    ret

.data
message:
    .asciz "Hii Add 2 Numbers !\n"
    .asciz "The result of the addition is :%d\n"
