;--------------------------------------------------------------------
;  
;  a000006m.asm
;
;  Integer part of square root of n-th prime 
;
;  OEIS A000006
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
        maxp    dw      547d
        maxst   dw      0040h
        arr     dw      547d DUP (00h)

.code

a000006    PROC


        push    bp
        mov     bp, sp
        push    si

        mov     dx,@data
        mov     ds,dx

        ; first, do a sieve of Eratosthenes to get primes up to 1000h

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
        jg      findroots
        mov     al,sieve[di]
        cmp     al,00h
        je      getnext
        mov     ax,di
        mov     arr[si], ax
        add     si, 02h
        jmp     getnext

findroots:
        mov     cx, 0001h
        mov     bx, 0000h
        mov     si, 0000h

getnextroot:

trynextroot:
        mov     ax, bx
        mul     bx
        cmp     ax, arr[si]
        jg      foundit
        inc     bx
        jmp     trynextroot

foundit:
        dec     bx
        mov     ax, bx
        call    dispA000006
        inc     cx
        inc     si
        inc     si
        cmp     cx, maxp
        je      alldone
        jmp     getnextroot                 

alldone:
        mov     ax, 4C00h
        int     21h

a000006    endp

dispA000006     PROC            ; display routine for a000006
                                ; a000006(n) in ax, n in cx
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

dispA000006     endp

end
