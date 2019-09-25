.model small
        display macro msg
        lea dx,msg
        mov ah,09h
        int 21h
        endm
.data
       msg1 db 0dh,0ah,"enter string1$"
       msg2 db 0dh,0ah,"enter string2$"
       msg3 db 0dh,0ah,"strings are equal$"
       msg4 db 0dh,0ah,"strings are not equal $"
       str1 db 10h dup(0)
       str2 db 10h dup(0)
       len1 db ($-str1)
       len2 db ($-str2)
.code
        mov ax,@data
        mov ds,ax
        mov es,ax
        display msg1
        mov si,00h
        display msg2
        mov di,00h
back1:
        
         lea si ,str1
        lea di,str2
        mov al,len1
        mov bl,len2
        cmp al,bl
        jne not_equal
        repe cmpsb
        jne not_equal
       display msg3
not_equal: display msg4
           jmp last
      
     jmp last
last:mov ah,4ch
     int 21h
     end



