#include <stdio.h>
#include <dos.h>

int main() {
    unsigned char error_level;
    asm {
        mov ah, 0x4D    ; DOS function to get return code
        int 0x21        ; DOS interrupt
        mov error_level, al
    }
    printf("Error level: %d\n", error_level);
    return error_level;
}