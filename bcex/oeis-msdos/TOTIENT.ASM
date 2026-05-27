;--------------------------------------------------------------------
;
; totient.asm
; 
; calculate Euler's totient function for an integer n
;
; n is passed in ax - phi(n) is returned in ax
;
;--------------------------------------------------------------------

.model small

.code

EXTRN   gcf:PROC
PUBLIC  totient

totient     PROC
    push    bp
    mov     bp, sp
    push    si
    push    bx
    push    cx
    push    dx

    mov     cx, ax      ; cx will hold n and will count down
    mov     bx, ax      ; bx will hold n and will preserve it
    mov     dx, 0000h   ; dx will hold numbe of co-primes found

DoNextcp:
    mov     ax, cx
    call    gcf
    cmp     ax, 01h
    jne     NotCoPrime
    inc     dx

NotCoPrime:
    dec     cx
    cmp     cx, 0000h
    jg      DoNextcp

    mov     ax, dx

    pop     dx
    pop     cx
    pop     bx
    pop     si
    pop     bp

    ret

totient    endp


end


