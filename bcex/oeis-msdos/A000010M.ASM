;--------------------------------------------------------------------
;  
;  a000010m.asm
;
;  Euler's totient function phi(n) 
;
;  OEIS A000010
;
;--------------------------------------------------------------------


.model small
.stack 100h

EXTRN   dispspace:PROC
EXTRN   disp0x:PROC
EXTRN   dispCR:PROC
EXTRN   disph16:PROC
EXTRN   dispd16:PROC
EXTRN   totient:PROC

.data
    
max         dw      1000h

.code

a000010     proc

    mov     dx, @data
    mov     ds, dx

    mov     cx, 0001h

GetNext:

    mov     ax, cx                  ; ax = n
    call    totient                 ; ax = phi(n)    
    call    dispA000010

    inc     cx
    cmp     cx, max
    jle     GetNext

AllDone:

    mov     ax, 4C00H               ; exit to dos
    int     21h

    ret

    a000010    endp

dispA000010     PROC            ; display routine for a000010
                                ; n in cx, a000010(n) in ax
    push    ax
    push    bx
    push    cx
    push    dx

    mov     dx, ax
    
    mov     ax, cx
    call    disph16
    call    dispspace
    call    dispspace
    call    dispspace
    call    dispspace
    
    call    dispd16
    call    dispspace
    call    dispspace
    call    dispspace
    call    dispspace

    mov     ax, dx
    call    disph16
    call    dispspace
    call    dispspace
    call    dispspace
    call    dispspace
    
    call    dispd16
    call    dispCR

    pop     dx
    pop     cx
    pop     bx
    pop     ax

    ret

dispA000010     endp

end

