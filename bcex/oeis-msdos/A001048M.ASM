;--------------------------------------------------------------------
;  
;  a001048m.asm
;
;  a(n) = n! + (n-1)! 
;
;  OEIS A001048
;
;--------------------------------------------------------------------


.model small
.stack 100h

EXTRN   factorial:PROC
EXTRN   dispspace:PROC
EXTRN   disp0x:PROC
EXTRN   dispCR:PROC
EXTRN   disph16:PROC
EXTRN   dispd16:PROC

.data
        max     dw      0009h
        arr     dw      0Ah DUP (00h)

.code

a001048    PROC

        push    bp
        mov     bp, sp
        push    si

        mov     dx,@data
        mov     ds,dx

        mov     si, 0000h
        mov     cx, 0001h

loop1:
        mov     ax, cx
        call    factorial
        mov     bx, ax
        dec     cx
        mov     ax, cx
        call    factorial
        add     ax, bx
        inc     cx
        mov     arr[si], ax
        call    dispA
        inc     cx
        inc     si
        inc     si
        cmp     cx, max
        je      doneloop
        jmp     loop1

doneloop:

        mov     ax, 4C00h
        int     21h

a001048    endp

;-------------------------------------------------------------------------

dispA           PROC            ; display routine for OEIS
                                ; a......(n) in ax, n in cx
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

    mov     ax, dx

    call    dispd16
    call    dispCR

    pop     dx
    pop     cx
    pop     bx
    pop     ax

    ret

dispA       endp


end
