;--------------------------------------------------------------------
;  
;  a000322m.asm
;
;  Pentanacci numbers: F(n) = F(n-1) + F(n-2) + F(n-3) + F(n-4)
;                      + F(n-5), F(0) = F(1) = F(2) = F(3) = F(4) = 1
;
;  OEIS A000322
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
        max     dw      14h
        arr     dw      15h DUP (00h)
        f0      dw      0000h        
        f1      dw      0000h        
        f2      dw      0000h        
        f3      dw      0000h        
        f4      dw      0000h        
        f5      dw      0000h

.code

a000322    PROC

        push    bp
        mov     bp, sp
        push    si

        mov     dx,@data
        mov     ds,dx

        mov     arr[0], 0001h       ; F(0) = 1
        mov     f5, 0001h
        mov     arr[2], 0001h       ; F(1) = 1
        mov     f4, 0001h
        mov     arr[4], 0001h       ; F(2) = 1
        mov     f3, 0001h
        mov     arr[6], 0001h       ; F(3) = 1
        mov     f2, 0001h
        mov     arr[8], 0001h       ; F(4) = 1
        mov     f1, 0001h

        mov     si, 000Ah
        mov     cx, 0005h           ; cx = n

getanother:
        mov     ax, f5
        add     ax, f4
        add     ax, f3
        add     ax, f2
        add     ax, f1

        mov     arr[si], ax
        inc     si
        inc     si
        inc     cx
        cmp     cx, max
        je      displaynow

        mov     bx, f4                  ; F5 = F4
        mov     f5, bx

        mov     bx, f3                  ; F4 = F3
        mov     f4, bx

        mov     bx, f2                  ; F3 = F2
        mov     f3, bx

        mov     bx, f1                  ; F2 = F1
        mov     f2, bx

        mov     f1, ax                  ; F2 = F1


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

a000322    endp

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
