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

arr         dw      1000h dup (00h)
arrlen      dw      0000h    

.code

isinarr     proc

    mov     dx, @data
    mov     ds, dx

    mov     si, 0000h
    mov     arr[si], 0001h
    mov     arr[si+2], 0003h
    mov     arr[si+4], 0007h
    mov     arr[si+6], 000Bh
    mov     arrlen, 4

    mov     ax, 000Bh
    call    inarr

    mov     ax, 4C00H               ; exit to dos
    int     21h

    ret

    isinarr    endp

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

end

