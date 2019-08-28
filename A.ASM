.model small
.data
a dw 20
b dw 20
c dw 12
.code
mov ax,@data
mov ds,ax
mov ax,a
mov bx,b
mov cx,c
add ax,bx
mov ah,4ch
int 21h
end
