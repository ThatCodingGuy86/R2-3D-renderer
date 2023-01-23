%include "utils.asm"

%define vec3 0, 0, 0 ; X, Y, Z

; Adds 2 3D vectors (in r8 and r9) and stores the result in the first vector (6 frames)
; void v3_add(vec3* v1, vec3* v2)
; {
;   *v1[0] = *v1[0] + *v2[0];
;   *v1[1] = *v1[1] + *v2[1];
;   *v1[2] = *v1[0] + *v2[2];
; }
%macro v3_add
    mov r7, [r9]
    add [r8], r7

    mov r7, [r9 + 1]
    add [r8 + 1], r7

    mov r7, [r9 + 1]
    add [r8 + 1], r7
%endmacro

; Subtracts 2 3D vectors (in r8 and r9) and stores the result in the first vector (6 frames)
; void v3_sub(vec3* v1, vec3* v2)
; {
;   *v1[0] = *v1[0] - *v2[0];
;   *v1[1] = *v1[1] - *v2[1];
;   *v1[2] = *v1[0] - *v2[2];
; }
%macro v3_sub
    mov r7, [r9]
    sub [r8], r7

    mov r7, [r9 + 1]
    sub [r8 + 1], r7

    mov r7, [r9 + 1]
    sub [r8 + 1], r7
%endmacro

; Divides 2 3D vectors (in r8 and r9) and stores the result in the first vector (13 frames)
; void v3_div(vec3* v1, vec3* v2)
; {
;   *v1[0] = *v1[0] / *v2[0];
;   *v1[1] = *v1[1] / *v2[1];
;   *v1[2] = *v1[0] / *v2[2];
; }
%macro v3_div
    mov r1, [r8]
    mov r0, [r9]

    div ; r3 = r1 / r0 (takes 2 cycles to complete and is non-blocking)

    mov r1, [r8 + 1] ; Shuffle data around while division unit is calculating

    mov [r8], r3 ; Division unit has finished calculating, transfer result

    mov r0, [r9 + 1]
    div
    mov r1, [r8 + 2]
    mov [r8 + 1], r3

    mov r0, [r9 + 2]
    div
    nop ; Can't shuffle more data, so just do nothing
    mov [r8 + 2], r3
%endmacro