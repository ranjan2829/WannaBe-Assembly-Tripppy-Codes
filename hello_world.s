
.global _main
.align 2

.text
_main:
    // Setup the stack frame
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Write syscall
    adrp x0, message@PAGE
    add x0, x0, message@PAGEOFF
    bl _printf

    // Cleanup and return
    mov w0, #0
    ldp x29, x30, [sp], #16
    ret

.data
message:
    .asciz "Hello, World!,Ranjan's System !\n"
