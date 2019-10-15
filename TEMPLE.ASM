.model small

display macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm    

.data
str db "TEMPLE$"
len equ ($-str)
msg1 db 0dh, 0ah, "Found$"
msg2 db 0dh, 0ah, "Not found$"

.code
mov ax, @data
mov ds, ax 
mov es, ax
mov di, offset str
mov ah,00
mov al, 'E'
mov bl,'A'
mov cx,06
cld 

find:
    scasb
    jne ag
    mov [di-1], bl 
ag: loop find

mov ah, 4ch
int 21h
        
end
