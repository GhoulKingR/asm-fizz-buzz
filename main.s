    .global _main
    .align 2

_main:
    // Store the iterator in stack pointer
    // because I'm not 100% sure which line changes
    // which registers
    sub sp, sp, #-32
    mov w0, #0
    str w0, [sp]

mainloop:
    ldr w0, [sp]            // load i from stack pointer to w0

    // while i < 10
    cmp w0, #100            // loop while i is less than 100
    bge mainloop_end

    add w0, w0, #1          // increment i
    str w0, [sp]            // store to stack pointer

    // if % 3 and % 5
    ldr w0, [sp]
    mov w1, #3
    udiv w2, w0, w1
    msub w5, w2, w1, w0
    cmp w5, #0
    bne next_compr
    
    ldr w0, [sp]
    mov w1, #5
    udiv w2, w0, w1
    msub w5, w2, w1, w0
    cmp w5, #0
    bne next_compr

    adr x0, fizzbuzz
    bl _printf
    b mainloop

    // if % 5
next_compr:
    ldr w0, [sp]
    mov w1, #5
    udiv w2, w0, w1
    msub w5, w2, w1, w0
    cmp w5, #0
    bne five_end

    adr x0, buzz
    bl _printf
    b mainloop

    // if % 3
five_end:
    ldr w0, [sp]
    mov w1, #3
    udiv w2, w0, w1
    msub w5, w2, w1, w0
    cmp w5, #0
    bne neither

    adr x0, fizz
    bl _printf
    b mainloop

neither:
    mov x1, #0              // print number if not divisible by 3 or 5
    ldr w1, [sp]
    adr x0, none
    bl _printf
    b mainloop

mainloop_end:
    add sp, sp, #32
    mov x0, #0
    mov x16, #1
    svc 0

none:       .asciz "%d\n"
fizz:       .asciz "Fizz\n"
buzz:       .asciz "Buzz\n"
fizzbuzz:   .asciz "FizzBuzz\n"
