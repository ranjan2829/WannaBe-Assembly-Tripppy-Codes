.global _main
.align 2

// Declare printf as an external function (already implied in aarch64)

.text
_main:
  # Setup the stack frame
  stp x29, x30, [sp, #-16]!
  mov sp, x29  // Update stack pointer for function calls (aarch64 convention)

  # Load two numbers into registers
  mov x0, #28     // Load 28 into x0
  mov x1, #2      // Load 2 into x1

  # Add the two numbers
  add x2, x0, x1  // x2 = x0 + x1

  # Print the result
  adrp x0, result_message@PAGE
  add x0, x0, result_message@PAGEOFF
  mov x1, x2      // Move the result into x1 (1st argument for printf)
  bl printf       // bl for calling external functions in aarch64

  # Cleanup and return
  mov x0, #0
  ldp x29, x30, [sp], #16
  ret

.data
result_message:
  .asciz "The result of the addition is: %d\n"
