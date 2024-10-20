.model small
.stack 100h
.data
msg db "abcdefghijklmnopqrstuvwxyz$"
.code

main proc
    mov ax, @data
    mov ds, ax
    call DisplayReverse
    mov ah, 4ch
    int 21h
main endp

DisplayReverse proc
    mov cx, 26  ; number of characters from a to z
    mov si, 25   ; index for the message

display_loop:
    mov dl, msg[si]
    ; To display characters normally, just use the value of dl
    mov ah, 02h ; displaying characters
    int 21h
    dec si
    loop display_loop
    ret
DisplayReverse endp

end main
