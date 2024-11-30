%include "in_out.asm"

SECTION .data
msg_function db "Функция: f(x) = 2*(x-1)", 0
msg_result db "Результат:", 0

SECTION .text
global _start

_start:
    mov eax, msg_function
    call sprintLF
    
    pop ecx                
    mov esi, 0             
    mov edi, 2             

next:
    cmp ecx, 0             
    jz _end                
    pop eax                
    call atoi              
    sub eax, 1             
    mul edi                
    add esi, eax           
    dec ecx                
    jmp next               

_end:
    mov eax, msg_result    
    call sprint
    mov eax, esi           
    call iprintLF
    call quit
