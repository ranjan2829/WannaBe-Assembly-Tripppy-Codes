Sure, let's simplify the explanation:

### Overview
This program prints the message "Hello, World!,Ranjan's System !\n" using assembly language for the ARM64 architecture. 

### Sections of the Program

1. **Setup**:
   ```assembly
   .global _main
   .align 2
   ```
   - Declares `_main` as the entry point of the program.
   - Ensures proper alignment for the code.

2. **Main Function**:
   ```assembly
   .text
   _main:
       stp x29, x30, [sp, #-16]!
       mov x29, sp

       adrp x0, message@PAGE
       add x0, x0, message@PAGEOFF
       bl _printf

       mov w0, #0
       ldp x29, x30, [sp], #16
       ret
   ```

   - **Stack Setup**: 
     - `stp x29, x30, [sp, #-16]!` saves the current frame pointer (`x29`) and link register (`x30`) on the stack and updates the stack pointer.
     - `mov x29, sp` sets the new frame pointer.

   - **Print Message**:
     - `adrp x0, message@PAGE` and `add x0, x0, message@PAGEOFF` load the address of the `message` string into `x0`.
     - `bl _printf` calls the `printf` function to print the message.

   - **Cleanup and Return**:
     - `mov w0, #0` sets the return value to 0.
     - `ldp x29, x30, [sp], #16` restores the saved frame pointer and link register.
     - `ret` returns from the function.

3. **Data Section**:
   ```assembly
   .data
   message:
       .asciz "Hello, World!,Ranjan's System !\n"
   ```

   - Defines the string to be printed.

### Summary
1. Sets up a new stack frame.
2. Loads the address of the message string.
3. Calls `printf` to print the message.
4. Cleans up the stack frame and returns.

In essence, this program sets up the environment, prints a message, and then cleans up before finishing.
