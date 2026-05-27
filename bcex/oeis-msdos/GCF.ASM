;--------------------------------------------------------------------
;
; gcf.asm
;
; find the greatest common factor of two numbers using Euclid's method
;
; n1 passed in ax, n2 passed in bx, gcf returned in ax
;
;--------------------------------------------------------------------

.model small

.data

arr     dw      0014h dup (00h)

n1      dw      0000h
n2      dw      0000h

n       dw      0000h

.code

PUBLIC gcf

gcf         PROC
    push    bp
    mov     bp, sp
    push    si
    push    ds
    push    bx
    push    cx
    push    dx

    mov     n1, ax                  ; store n1, n2
    mov     n2, bx

    mov     bx, n1                  ; put higher number in n1
    mov     cx, n2
    cmp     bx, cx
    jge     TakeStep
    mov     n1, cx
    mov     n2, bx

TakeStep:
    mov     dx, 0000h               ; implement Euclid's method
    mov     ax, n1
    mov     bx, n2
    div     bx
    cmp     dx, 0000h
    je      Found
    mov     n1, bx 
    mov     n2, dx
    jmp     TakeStep

Found:
    mov     ax, bx

AllDone:

    pop     dx
    pop     cx
    pop     bx
    pop     ds
    pop     si
    pop     bp

    ret

gcf     endp



end


