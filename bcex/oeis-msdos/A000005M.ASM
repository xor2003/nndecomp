;  
;  a000005m.asm
;
;  count the divisors of numbers up to 1000 
;
;  OEIS A000005
;


.model small
.stack 100h

EXTRN dispspace:PROC
EXTRN disp0x:PROC
EXTRN dispCR:PROC
EXTRN disph16:PROC
EXTRN dispd16:PROC

.data
    
divisor     dw      0001h
max         dw      1000h

.code

a000005     proc

    mov     dx, @data
    mov     ds, dx

    mov     si, 0000h

    mov     bx,0001h            ; bx will hold the number whose divisors
                                ; we are trying to count

CountDiv:
    mov     cx,0000h            ; cx = number of divisors found
    mov     dx,0000h            ; dx will hold remainder after division
    mov     divisor,01h

DoNext:
    mov     ax,bx
    mov     dx,0000h
    div     divisor
    or      dx,dx               ; does the remainder = 0?
    jnz     DontCount           ; if not, don't count it because divisor
                                ; does not divide ax
    inc     cx

DontCount:
    inc     divisor
    cmp     divisor, bx
    jle     DoNext

    call    dispA000005

    inc     bx
    cmp     bx, max
    jle     CountDiv

AllDone:

    mov     ax, 4C00H               ; exit to dos
    int     21h

    ret

    a000005    endp

dispA000005     PROC            ; display routine for a000005
                                ; n in bx, num divisors in cx
    push    ax
    push    bx
    push    cx
    push    dx

    mov     ax, bx
    call    disph16
    call    dispspace
    call    dispspace
    call    dispspace
    call    dispspace
    
    mov     ax, bx
    call    dispd16
    call    dispspace
    call    dispspace
    call    dispspace
    call    dispspace

    mov     ax, cx
    call    disph16
    call    dispspace
    call    dispspace
    call    dispspace
    call    dispspace
    
    mov     ax, cx
    call    dispd16
    call    dispCR

    pop     dx
    pop     cx
    pop     bx
    pop     ax

    ret

dispA000005     endp

end

