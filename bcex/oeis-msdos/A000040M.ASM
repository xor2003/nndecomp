;--------------------------------------------------------------------
;  
;  a000040m.asm
;
;  The prime numbers (using a sieve of Eratosthenes 
;
;  OEIS A000040
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

.code

a000040    PROC

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

dsply:
        mov     di,0000h
        mov     si,0000h

getnext:
        inc     di
        cmp     di,max
        jg      alldone
        mov     al,sieve[di]
        cmp     al,00h
        je      getnext
        mov     ax,di
        mov     arr[si], ax
        call    dispA000040         ; with the prime in ax, call the
                                    ; display routine
        add     si, 02h
        jmp     getnext

alldone:

        mov     ax, 4C00h
        int     21h

a000040    endp

dispA000040     PROC            ; display routine for a000040
                                ; a000040(n) in ax
    push    ax
    push    bx
    push    cx
    push    dx
    
    call    dispd16
    call    dispCR

    pop     dx
    pop     cx
    pop     bx
    pop     ax

    ret

dispA000040     endp

end
