.global _main
.align 2

// Declare printf as an external function
.extern printf

.text
_main:
    // Setup the stack frame
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Load two numbers into registers
    mov w0, #28         // Load 28 into w0
    mov w1, #2          // Load 2 into w1

    // Add the two numbers
    add w2, w0, w1      // w2 = w0 + w1

    // Print initial message
    adrp x0, initial_message@PAGE
    add x0, x0, initial_message@PAGEOFF
    bl printf

    // Print the result
    adrp x0, result_message@PAGE
    add x0, x0, result_message@PAGEOFF
    mov x1, x2          // Move the result into x1
    bl printf

    // Cleanup and return
    mov w0, #0
    ldp x29, x30, [sp], #16
    ret

.data
initial_message:
    .asciz "Hi! Adding 2 Numbers...\n"
result_message:
    .asciz "The result of the addition is: %d\n"
