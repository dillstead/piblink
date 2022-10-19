.section ".text"

begin:
        // Turn LED on
        mov	r1, #32768      // 0x8000
        mov     r0, #32
        movt	r0, #16160      // 0x3f20
        str     r1, [r0]

        mov     r3, #0
        movt    r3, #32
delay_off:  
        subs    r3, r3, #1
        bne     delay_off

        // Turn LED off
        mov     r0, #44
        movt	r0, #16160    
        str     r1, [r0]

        mov     r3, #0
        movt    r3, #32
delay_on:
        subs    r3, r3, #1
        bne     delay_on

        b       begin
