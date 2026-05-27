;--------------------------------------------------------------------
;  
;  a001043m.asm
;
;  The sums of successive prime numbers 
;
;  OEIS A001043
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
        sieve   db      1000h DUP (01h)
        max     dw      0FFFh
        maxst   dw      0040h
        arr     dw      547d DUP (00h)
        sums    dw      546d DUP (00h)

.code

a001043    PROC

        push    bp
        mov     bp, sp
        push    si

        mov     dx,@data
        mov     ds,dx

        mov     sieve[0],00h            ; 0 is not a prime
        mov     sieve[1],00h            ; 1 is not a prime

        mov     bx,0002h                ; bx will hold the step
        mov     di,bx                   ; di is the counter thru the sieve

loop1:
        add     di,bx
        cmp     di,max
        jg      loop2
        mov     sieve[di],00h
        jmp     loop1

loop2:
        inc     bx
        cmp     bx,maxst                ; we only have to go up to
                                        ; the sqrt of the max sieve size
        jg      donsie
        mov     di,bx
        mov     al,sieve[di]
        cmp     al,00h
        je      loop2
        jmp     loop1

donsie:

; now that the sieve is complete, move the primes into the array

        mov     di,0000h
        mov     si,0000h
        mov     cx,0000h

getnext:
        inc     di
        cmp     di,max
        jg      getsums
        mov     al,sieve[di]
        cmp     al,00h
        je      getnext
        mov     ax,di
        mov     arr[si], ax
        add     si, 02h
        inc     cx
        jmp     getnext

getsums:
        mov     bx, cx
        dec     bx
        mov     cx, 0000h
        mov     si, 0000h
        
getsum:
        mov     ax, arr[si]
        inc     si
        inc     si
        add     ax, arr[si]
        call    dispA
        inc     cx
        cmp     cx, bx
        je      alldone                        
        jmp     getsum

alldone:
        mov     ax, 4C00h
        int     21h

a001043    endp

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
