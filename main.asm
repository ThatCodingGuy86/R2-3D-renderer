%include "common"
%include "macros.asm"

; Function calling convention:
; Return address is stored in R4, and arguments are passed in R1, R2, and R3.
; The callee's allowed registers are R5, R6, R7, and R8.
; The return value is stored in R5. 

%define vec3 0, 0, 0 ; X, Y, Z

; Adds 2 given 3d vectors and stores the result in the primary vector
; void v3_add(vec3* v1, vec3* v2)
; {
;   *v1[0] = *v1[0] + *v2[0];
;   *v1[1] = *v1[1] + *v2[1];
;   *v1[2] = *v1[0] + *v2[2];
; }
%macro v3_add
    mov r5, [r2]
    add [r1], r5
    
    mov r5, [r2+1]
    add [r1+1], r5

    mov r5, [r2+2]
    add [r1+2], r5
%endmacro

; Applies the projection matrix to the given 4d vector
; void proj_apply(vec4_f* v)
; {
;   const fixed S = 1.728555;
;   *v[0] = *v[0] * S;
;   *v[2] = *v[2] * S;
;   *v[4] = *v[4] * -1.02 + v[6] * -2.04;
;   *v[6] = *v[6] * -1;
;
;   if(*v[6] != 1) // Convert from homogeneous to Cartesian coordinates
;   {
;       *v[0] = *v[0] / *v[6];
;       *v[2] = *v[2] / *v[6];
;       *v[4] = *v[4] / *v[6];
;   }
; }
%macro proj_apply

%endmacro

; Applies the world-to-camera matrix to the given 4d vector
; void cam_apply(vec4_f* v)
; {
;   *v[2] = *v[2] + *v[6] * -10;
;   *v[4] = *v[4] + *v[6] * -20;
;   
;   if(*v[6] != 1) // Convert from homogeneous to Cartesian coordinates
;   {
;       *v[0] = *v[0] / *v[6];
;       *v[2] = *v[2] / *v[6];
;       *v[4] = *v[4] / *v[6];
;   }
; }
%macro cam_apply

%endmacro


org 0x0

start: ; Start label
    mov sp, 0x2000 ; This program uses the stack, so set SP safely out of the way of program memory
    
    mov r9, 0 ; Set terminal port to 0, because that's where the terminal should be
    mov r10, 1 ; Set multiplier port to 1
    mov r11, 2 ; Set divider port to 2

    mov r1, vec3_x
    mov r2, vec3_y

    v3_add

vec3_x:
    dw 1, 0, 2

vec3_y:
    dw 2, 2, 0



