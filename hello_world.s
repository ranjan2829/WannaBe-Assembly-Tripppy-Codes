.global _main
.align 2


.text
_main:
    //Setting up the frame
    stp x29 , x30, [sp,#-16]!
    mov x29,sp

    //Writing the System call

    adrp x0,message@PAGE
    add x0,x0,message@PAGEOFF
    bl _printf

    //clean up and return

    mov w0,#0
    ldp x29,x30,[sp],#16

    ret
.data
message:
    .asciz "Hello World ! \n ,Ranjan 's Assembly Project ! \n"
