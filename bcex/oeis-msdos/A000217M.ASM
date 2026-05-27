;----------------------------------------------------------------------
;  
;  a000217m.asm
;
;  The Triangular Numbers
;
;  OEIS a000217
;
;----------------------------------------------------------------------

.model small
.stack 100h

EXTRN   dispspace:PROC
EXTRN   disp0x:PROC
EXTRN   dispCR:PROC
EXTRN   disph16:PROC
EXTRN   dispd16:PROC

.data
max   dw      0169h

.code

a000217    proc

    push    bp
    mov     bp, sp
    push    si

    mov     dx, @data
    mov     ds, dx

    mov     cx,01h              ; 

    mov     ax, 01h

GetNext:        
    cmp     cx,max              ; cx = max?
    je      AllDone             ; if so, we're finished
    inc     cx
    add     ax,cx
    call    dispA000217   
    jmp     GetNext

AllDone:

    mov     ax, 4C00h
    int     21h


a000217    endp


dispA000217     PROC            ; display routine for a000217
                                ; n in cx, a000010(n) in ax
    push    ax
    push    bx
    push    cx
    push    dx

    mov     dx, ax
    
    mov     ax, cx
    
    call    dispd16
    call    dispspace
    call    dispspace
    call    dispspace
    call    dispspace

    mov     ax, dx
    
    call    dispd16
    call    dispCR

    pop     dx
    pop     cx
    pop     bx
    pop     ax

    ret

dispA000217     endp

end

