;--------------------------------------------------------------------
;  
;  a000045m.asm
;
;  Fibonacci numbers: F(n) = F(n-1) + F(n-2), F(0) = 0 and F(1) = 1  
;
;  OEIS A000045
;
;--------------------------------------------------------------------


.model small
.stack 100h

EXTRN   dispspace:PROC
EXTRN   disp0x:PROC
EXTRN   dispCR:PROC
EXTRN   disph16:PROC
EXTRN   dispd16:PROC

.data
        max     dw      19h
        arr     dw      19h DUP (00h)
        
.code

a000045    PROC

        push    bp
        mov     bp, sp
        push    si

        mov     dx,@data
        mov     ds,dx

        mov     arr[0], 0000h       ; F(0) = 0
        mov     arr[2], 0001h       ; F(1) = 1
        mov     si, 0004h
        mov     cx, 0002h           ; cx = n
        mov     bx, arr[0]          ; bx = F[n-2]
        mov     dx, arr[2]          ; dx = F[n-1]

getanother:
        mov     ax, bx
        add     ax, dx
        mov     arr[si], ax
        inc     si
        inc     si
        inc     cx
        cmp     cx, max
        je      displaynow
        mov     bx, dx
        mov     dx, ax
        jmp     getanother

displaynow:
        mov     cx, 0000h
        mov     si, 0000h               

disploop:
        mov     ax, arr[si]
        call    dispA
        inc     cx
        cmp     cx, max
        je      alldone
        inc     si
        inc     si
        jmp     disploop        

alldone:
        mov     ax, 4C00h
        int     21h

a000045    endp

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
