
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