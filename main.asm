%include "common"
%include "utils.asm"
%include "vec.asm"

; Function calling convention:
; GP registers are r0, r1, r2, r3, r4, r5, r6, and r7
; Arguments are in r8, r9, and r10
; Return value is in r11
; Return address is in r12

org 0x0

start: ; Start label
    mov sp, 0x2000 ; This program uses the stack, so set SP safely out of the way of program memory

    mov r1, vec3_x
    mov r2, vec3_y

    v3_add
    v3_div

padding_1:
    dw 0, 0, 0

vec3_x:
    dw 1, 0, 2
padding_2:
    dw 0, 0, 0
vec3_y:
    dw 2, 2, 0



