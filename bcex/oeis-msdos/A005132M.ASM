;  
;  a005132m.asm
;
;  Recaman's sequence 
;
;  OEIS A005132
;


.model small
.stack 100h

EXTRN dispspace:PROC
EXTRN disp0x:PROC
EXTRN dispCR:PROC
EXTRN disph16:PROC
EXTRN dispd16:PROC

.data

arr         dw      1000h dup (00h)
arrlen      dw      0000h    
max         dw      800h

.code

a005132     proc

    mov     dx, @data
    mov     ds, dx

    mov     si, 0000h
    mov     cx, 0000h               ; cx holds n

    mov     arr[si], 0000h          ; a[0] = 0
    
nextn:
    inc     cx
    mov     dx, arr[si]             ; dx = a[n-1]
    cmp     cx, dx
    jg      alternate               ; if a[n-1]-n negative go to alternate    
    mov     ax, dx                  ; ax = a[n-1]
    sub     ax, cx                  ; ax = a[n-1] - n

    mov     bx, ax                  ; preserve ax 
    call    inarr
    cmp     ax, 0001h               ; is a[n-1] - n already in sequence?
    je      alternate               ; if so go to alternate

    mov     ax, bx
    jmp     addtosequence

alternate:    
    mov     ax, dx                  ; ax = a[n-1]
    add     ax, cx                  ; ax = a[n-1] + n

addtosequence:
    inc     si
    inc     si
    mov     arr[si], ax
    inc     arrlen
    call    dispA

    cmp     cx, max
    je      alldone
    jmp     nextn

alldone:
    mov     ax, 4C00H               ; exit to dos
    int     21h

    ret

a005132         endp

inarr           PROC
    push        si
    push        bx
    push        cx
    push        dx

    mov         bx, ax
    mov         ax, 0000h           ; ax is now found flag, bx is
                                    ; integer for which to search array

    mov         cx, arrlen
    mov         si, 0000h
    
searchnext:
    cmp         bx, arr[si]
    je          found
    inc         si
    inc         si
    loop        searchnext
    jmp         donesearch

found:
    mov         ax, 0001h

donesearch:
    pop         dx
    pop         cx
    pop         bx
    pop         si

    ret
inarr           endp

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

