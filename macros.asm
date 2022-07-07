; This is a library that implements a few useful things,
; such as interaction with an external multiplier and divider,
; a (slightly faster) call operation than the inbuilt one,
; plus a few useful things for functions, so less boilerplate is needed.

%macro mul ; Multiplies R0 by R1, and then stores the result in R2. Takes 2 frames to complete.
    bump r10
%endmacro

%macro div ; Divides R1 by R0, and then stores the remainder in R2, and the result in R3. Takes 2 frames to complete.
    bump r11
%endmacro

%macro _call ; Calls the function whose address is in R0
    mov r4, ip+2 ; Save return address in r4
    jmp r0 ; Jump to function
%endmacro

%macro _ret ; Returns from the current function
    jmp r4
%endmacro

%macro pushr ; Push registers
    mov [sp], r5
    mov [sp+1], r6
    mov [sp+2], r7
    mov [sp+3], r8
    add sp, 4
%endmacro

%macro popr ; Pop registers
    mov r8, [sp-1]
    mov r7, [sp-2]
    mov r6, [sp-3]
    mov r5, [sp-4]
    sub sp, 4
%endmacro