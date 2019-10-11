.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
        msg1 db 0dh,0ah,"enter 1st string=$"
        msg2  db 0dh,0ah,"enter 2st string=$"
        msg3 db 0dh,0ah," strings are equal $"
        msg4  db 0dh,0ah," strings are not equal $"
        s1 db 10h dup(0)
         s2 db 10h dup(0)
         len1 dw 0
         len2 dw 0
.code
        mov ax,@data
        mov ds,ax
        display msg1
        mov si,00h
        mov di,00h
string1:mov ah,01h
        int 21h
        cmp al,0dh
        jz disp2
        mov s1[si],al
        inc si
        inc len1
        jmp string1
disp2:display msg2
string2:mov ah,01h
        int 21h
        cmp al,0dh
        jz next
        mov s2[di],al
        inc di
        inc len2
        jmp string2
next:mov cx,len1
      cmp cx,len2
      jnz notequal
      mov si,00h
      mov di,00h
      mov cx,len1
loop1:mov bl,s1[si]
       cmp bl,s2[di]
       jnz notequal
       inc si
       inc di
       loop loop1
       display msg3
       jmp last
notequal:display msg4
last:mov ah,4ch
        int 21h
        end

