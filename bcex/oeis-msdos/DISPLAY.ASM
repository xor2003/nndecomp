;--------------------------------------------------------------------
;  
;  display.asm
;
;  procedures for displaying integer output 
;
;--------------------------------------------------------------------


.model small

PUBLIC dispspace
PUBLIC disp0x
PUBLIC dispCR
PUBLIC dispd16
PUBLIC disph16


.code


;--------------------------------------------------------------------


disph16 PROC                    ; display a word in hex
                                ; word to display is in ax
        push    ax
        push    bx
        push    cx
        push    dx

        call    disp0x          ; display the initial 0x
        mov     bx, ax
        shr     ax, 12          ; ax = most significant nibble of n
        call    disph
        
        shl     ax, 12
        sub     bx, ax          ; bx = 3 least significant nibbles of n
        mov     ax, bx          
        shr     ax, 8           ; ax = 2nd most significant nibble of n
        call    disph

        shl     ax, 8
        sub     bx, ax          ; bx = 2 least significant nibbles of n
        mov     ax, bx
        shr     ax, 4           ; ax = 2nd least signicant nibble of n
        call    disph

        shl     ax, 4
        sub     bx, ax          ; bx = least significant nibble of n
        mov     ax, bx          ; ax = least significant nibble of n
        call    disph

        pop     dx
        pop     cx
        pop     bx        
        pop     ax

        ret

disph16 endp

;---------------------------------------------------------------------

disph   PROC                        ; display one hex digit of a number
                                    ; nibble to display is in al
        push    ax
        push    dx
        
        add     ax, 30h             ; convert to ascii
        cmp     ax, 39h             ; check to see if A-F
        jle     dig09
        add     ax, 07h
dig09:
        mov     dl, al              ; DOS WRITE TO STDOUT
        mov     ah, 02h
        int     21h

        pop     dx
        pop     ax

        ret

disph   endp

;--------------------------------------------------------------------

dispd16 PROC                        ; display a word in decimal
                                    ; word to display is in ax
        push    ax
        push    bx
        push    cx
        push    dx

        mov     dx, 0000h           ; set up for div
        mov     cx, 2710h
        div     cx                  ; divide ax by 10000d to get first digit
        mov     bx, dx              ; put remainder in bx
        call    dispd

        mov     dx, 0000h           ; set up for div
        mov     ax, bx              ; the remainder from previous is now a
                                    ; four digit decimal number
        mov     cx, 03E8h
        div     cx                  ; divide ax by 1000d to get second digit
        mov     bx, dx              ; put remainder in bx
        call    dispd

        mov     dx, 0000h           ; set up for div
        mov     ax, bx              ; the remainder from previous is now a
                                    ; three digit decimal number
        mov     cx, 0064h
        div     cx                  ; divide ax by 100d to get second digit
        mov     bx, dx              ; put remainder in bx
        call    dispd

        mov     dx, 0000h           ; set up for div
        mov     ax, bx              ; the remainder from previous is now a
                                    ; two digit decimal number
        mov     cx, 000Ah
        div     cx                  ; divide ax by 10d to get second digit
        mov     bx, dx              ; put remainder in bx
        call    dispd

        mov     dx, 0000h
        mov     ax, bx              ; the remainder from previous is now a
                                    ; one digit decimal number
        call    dispd

        pop     dx
        pop     cx
        pop     bx        
        pop     ax
        ret

dispd16 endp

;--------------------------------------------------------------------

dispd   PROC                        ; display a decimal digit
                                    ; digit to display is in ax

        push    ax
        push    dx

        add     ax, 30h             ; convert to ASCII

        mov     dl, al              ; DOS WRITE TO STDOUT
        mov     ah, 02h
        int     21h

        pop     dx
        pop     ax
        ret

dispd   endp

;--------------------------------------------------------------------

dispspace   PROC                    ; display a space

        push    ax
        push    dx

        mov     dl, 20h
        mov     ah, 02h
        int     21h

        pop     dx
        pop     ax

        ret

dispspace  endp

;--------------------------------------------------------------------

disp0x      PROC                    ; display hex indicator

        push    ax
        push    dx

        mov     dl, 30h             ; display 0
        mov     ah, 02h
        int     21h

        mov     dl, 78h             ; display x
        mov     ah, 02h
        int     21h
        
        pop     dx
        pop     ax

        ret

disp0x      endp

;--------------------------------------------------------------------

dispCR      PROC                    ; display a CR

        push    ax
        push    dx

        mov     dl, 0Dh             ; display CR
        mov     ah, 02h
        int     21h

        mov     dl, 0Ah             ; display NL
        mov     ah, 02h
        int     21h
        
        pop     dx
        pop     ax

        ret

dispCR      endp

;--------------------------------------------------------------------

end

