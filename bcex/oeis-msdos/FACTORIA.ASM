;--------------------------------------------------------------------
;
; factoria.asm
; 
; n! for integer n
;
; n is passed in ax - n! is returned in ax
;
;--------------------------------------------------------------------

.model small

.code

PUBLIC  factorial

factorial     PROC
    push    bp
    mov     bp, sp
    push    si

    push    bx
    push    cx
    push    dx

    mov     cx, ax      ; cx will hold n and will count down
    mov     ax, 0001h

    cmp     cx, 00h
    je      done        ; 0! = 1

DoNext:
    mul     cx
    loop    DoNext

done:
    pop     dx
    pop     cx
    pop     bx
    pop     si
    pop     bp

    ret

factorial   endp


end


