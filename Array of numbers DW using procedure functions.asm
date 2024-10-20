.model small
.stack 100h
.data
Num dw 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
count db 10
sum db 0
avg db 0
.code

main proc
    mov ax, @data
    mov ds, ax

    ; Call the procedure to calculate the sum
    call CalculateSum

    ; Call the procedure to calculate the average
    call CalculateAverage

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

CalculateSum proc
    mov cx, count          ; Number of elements
    mov si, offset Num     ; Pointer to the number array
    xor dl, dl             ; Clear dl for summation

sum_loop:
    add dl, [si]           ; Add the current number to dl
    add si, 2              ; Move to the next word (2 bytes)
    loop sum_loop          ; Loop until cx is 0

    mov sum, dl            ; Store the sum in the sum variable
    ret
CalculateSum endp

CalculateAverage proc
    mov al, sum            ; Load the sum into al
    mov bl, count          ; Load the count into bl
    div bl                 ; Divide sum by count to get average
    mov avg, al            ; Store the average

    ret
CalculateAverage endp

end main
