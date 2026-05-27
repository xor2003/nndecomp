;--------------------------------------------------------------------
;  
;  a000018m.asm
;
;  Number of positive integers <= 2^n of the form x^2 + 16y^2  
;
;  OEIS A000018
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
        x       dw      00h
        y       dw      00h
        arr     dw      10h DUP (00h)
        used    dw      5001h DUP (00h)

.code

a000018    PROC

        push    bp
        mov     bp, sp
        push    si

        mov     dx,@data
        mov     ds,dx

xloop:


yloop:
        mov     ax, y
        mul     y
        cmp     ax, 05000h
        jg      doney
        mov     dx, 10h
        mul     dx
        cmp     ax, 05000h
        jg      doney
        mov     bx, ax              ; bx = 16y^2, which is less than 4000h
        
        mov     ax, x
        mul     x                   ; ax = x^2
        cmp     ax, 05000h
        jg      donex           
        
        add     ax, bx              ; ax = x^2 + 16y^2
        cmp     ax, 05000h
        jg      doney   

        ; check to be sure that the integer in ax hasn't already been counted

        push    ax
        push    dx
        mov     bx, 02h
        mul     bx
        mov     bx, ax
        pop     dx
        pop     ax
        cmp     used[bx], 00h
        jg      donecount               ; if it has been counted, don't
                                        ; count it again

        mov     used[bx], 01h           ; mark it so it won't be counted
                                        ; again           

        mov     cx, 0000h
        mov     dx, 0001h
        mov     si, 0000h
 
isless:                                 ; now see which buckets the integer
                                        ; falls into for counting

        cmp     ax, 00h                 ; don't count it if it's zero
        je      dontcount

        cmp     ax, dx                  ; check 2^n
        jg      dontcount
        inc     arr[si]                 ; count if it's <=

dontcount:
        inc     cx                      ; cx = n
        cmp     cx, 0Eh                 ; if we have exceed 0E, we're done
        jg      donecount

        inc     si
        inc     si
        shl     dx, 1                   ; dx = 2^n
        jmp     isless

donecount:
        inc     y
        jmp     yloop            

doney:  
        inc     x
        mov     y, 0
        jmp     xloop

donex:
        mov     cx, 0000h
        mov     si, 0000h
disploop:
        mov     ax, arr[si]
        call    dispA
        inc     cx
        cmp     cx, 0Eh
        jg      alldone
        inc     si
        inc     si
        jmp     disploop        

alldone:
        mov     ax, 4C00h
        int     21h

a000018    endp

;-------------------------------------------------------------------------

dispA       PROC                ; display routine for OEIS
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
