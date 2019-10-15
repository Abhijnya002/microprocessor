.model small
.data
x dw 3
res dw ?
.code
mov ax,@data
mov ds,ax
mov ax,x
mul x
mov bx,ax
mov cx,5
mul cx
mov cx,bx
mov bx,ax
mov ax,cx
mul x
mov cx,9
mul cx
add ax,bx
sub ax,2
mov res,ax
mov ah,4ch
int 21h
end
