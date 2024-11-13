%include 'in_out.asm' 
SECTION .data
    msg db 'Введите значение переменной x: ', 0  
    rem db 'Результат: ', 0                       

SECTION .bss
    x RESB 80   

SECTION .text
    GLOBAL _start
_start:
    mov eax, msg  
    call sprint   

    mov ecx, x    
    mov edx, 80   
    call sread    

    mov eax, x    
    call atoi     

    ; f(x) = (3 / 4) * (x - 1) + 5
    sub eax, 1    ; eax = x - 1
    mov ebx, 3    ; Умножаем на 3
    imul eax, ebx ; eax = (x - 1) * 3
    mov ebx, 4    ; Делим на 4
    xor edx, edx  ; Обнуляем edx перед делением
    div ebx       ; eax = (x - 1) * 3 / 4
    add eax, 5    ; eax = (x - 1) * 3 / 4 + 5

    mov edi, eax  
    mov eax, rem  
    call sprint   
    mov eax, edi  
    call iprintLF   
    call quit 