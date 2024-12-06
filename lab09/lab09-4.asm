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
    pop edx
    sub ecx, 1
    mov esi, 0                   

next:
    cmp ecx, 0             
    jz _end                
    pop eax                
    call atoi 
    call _calculate_fx               
    add esi, eax           
    loop next               

_end:
    mov eax, msg_result    
    call sprint
    mov eax, esi           
    call iprintLF
    call quit

_calculate_fx:
sub eax, 1             
mov ecx, 2             
mul ecx
ret
