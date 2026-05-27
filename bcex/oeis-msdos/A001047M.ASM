;--------------------------------------------------------------------
;  
;  a001047m.asm
;
;  a[n] = 3^n - 2^n  
;
;  OEIS A001047
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
        max     dw      0Ah
        arr     dw      0Ah DUP (00h)
        
.code

a001045    PROC

        push    bp
        mov     bp, sp
        push    si

        mov     dx,@data
        mov     ds,dx

        mov     cx, 0000h
        mov     si, 0000h

getanother:
        call    pow2n
        mov     bx, ax
        call    pow3n
        sub     ax, bx
        mov     arr[si], ax
        inc     si
        inc     si
        inc     cx    
        cmp     cx, max
        je      displaynow
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

a001045    endp

;-------------------------------------------------------------------------
pow3n           PROC        ; n in cx, 3^n in ax

        push    bx
        push    cx
        push    dx
        
        mov     ax, 01h     ; if n = 0, 3^n = 1
        cmp     cx, 00h
        je      pdone

        mov     bx, 03h

p3loop:
        mul     bx
        dec     cx
        cmp     cx, 00h
        je      pdone
        jmp     p3loop      
        
pdone:
        pop     dx
        pop     cx
        pop     bx
        ret
pow3n           endp

;-------------------------------------------------------------------------

pow2n           PROC        ; n in cx, 2^n in ax

        push    bx
        push    cx
        push    dx
        
        mov     ax, 01h     

        shl     ax, cl
        
        pop     dx
        pop     cx
        pop     bx
        ret
pow2n           endp

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
