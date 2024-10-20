.model small
.stack 100h
.data
    num1 db 3
    num2 db 4
    num3 db 5
    num4 db 3
    num5 db 5
    result db 0
    msg db 'The average of numbers: $'
.code

main proc
    call CalculateAverage

    mov ah, 09h
    lea dx, msg
    int 21h

    mov ah, 02h
    mov al, result
    int 21h

    mov ah, 4Ch
    int 21h
main endp

CalculateAverage proc
    ; Load numbers into registers
    mov al, num1
    add al, num2
    add al, num3
    add al, num4
    add al, num5

    ; Divide by 5
    mov cl, 5
    div cl

    ; Store result
    mov result, al
    ret
CalculateAverage endp

end main
