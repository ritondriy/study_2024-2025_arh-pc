%include 'in_out.asm'

section .data
    prompt_x db 'Введите x: ', 0
    prompt_a db 'Введите a: ', 0
    result_msg db 'Результат f(x) = ', 0

section .bss
    x resb 10
    a resb 10
    result resb 10

section .text
    global _start

_start:
    ; ---------- Ввод значения x
    mov eax, prompt_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    call atoi
    mov [x], eax  ; Сохраняем преобразованное значение x

    ; ---------- Ввод значения a
    mov eax, prompt_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    call atoi
    mov [a], eax  ; Сохраняем преобразованное значение a

    ; ---------- Проверка значения a
    mov eax, [a]
    cmp eax, 0
    jne calculate_2x_plus_a  ; Если a ≠ 0, переходим к calculate_2x_plus_a

calculate_2x_plus_1:
    ; Вычисляем f(x) = 2 * x + 1
    mov eax, [x]
    shl eax, 1      ; eax = 2 * x
    add eax, 1      ; eax = 2 * x + 1
    mov [result], eax
    jmp print_result

calculate_2x_plus_a:
    ; Вычисляем f(x) = 2 * x + a
    mov eax, [x]
    shl eax, 1      ; eax = 2 * x
    add eax, [a]    ; eax = 2 * x + a
    mov [result], eax

print_result:
    ; ---------- Вывод результата
    mov eax, result_msg
    call sprint     ; Печатаем сообщение
    mov eax, [result]
    call iprintLF   ; Печатаем результат
    
    ; ---------- Завершение программы
    call quit
