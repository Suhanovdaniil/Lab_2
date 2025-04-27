; --- КОНСТАНТЫ ---

section .data
    ; приглашения к вводу
    prompt1     db 'Введите количество чисел: '
    prompt1_len equ $ - prompt1
    prompt2     db 'Введите сами числа', 0xA
    prompt2_len equ $ - prompt2
    prompt3     db 'Число: '
    prompt3_len equ $ - prompt3
    newline     db 0xA
    space       db 0x20
    ; Системные вызовы
    sys_exit    equ 1
    sys_read    equ 3
    sys_write   equ 4
    ; Потоки ввода/вывода
    stdin       equ 0
    stdout      equ 1

; --- ПЕРЕМЕННЫЕ ---

section .bss
    buffer  resb    100     ; память под буфер
    buflen  equ     100     ; размер буфера
    count   resd    1       ; количество чисел
    number  resd    1       ; число
    sum     resd    1       ; сумма цифр
    prod    resd    1       ; произведение цифр
    diff    resd    1       ; разность
    len     resd    1       ; длина строки

section .text
    global _start

; --- МАКРОСЫ ---

; Печатает строку
%macro PrintString 2
    push eax
    push ebx
    push ecx
    push edx
    mov eax, sys_write
    mov ebx, stdout
    mov ecx, %1
    mov edx, %2
    int 0x80
    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro

; Печатает один символ
%macro PrintSpace 0
    PrintString space, 1    
%endmacro

; Печатает перевод строки
%macro NewLine 0
    PrintString newline, 1
%endmacro

; Считывает строку
%macro InputString 2
    push eax
    push ebx
    push ecx
    push edx
    mov eax, sys_read
    mov ebx, stdin
    mov ecx, %1
    mov edx, %2
    int 0x80
    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro

; Выход: exit(0)
%macro Exit 0
    mov eax, sys_exit
    xor ebx, ebx
    int 0x80
%endmacro

; --- ФУНКЦИИ ---

; Переводит строку в число
; Аргументы: адрес стоки: [esp + 4]
; Возвращает: число в регистре eax
str2num:
    ; сохраняем регистры
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    
    ; Стандартный алгоритм перевода строки в число
    xor eax, eax
    xor ecx, ecx
    mov ebx, [ebp + 8]
.circle:
    xor edx, edx
    mov dl, [ebx + ecx] ; -> dl очередной символ
    ; проверяем что цифра: dl >= '0' and dl <= '9'
    cmp dl, '0'
    jb .return
    cmp dl, '9'
    ja .return
    ; eax = eax * 10 + (dl - '0')
    sub dl, '0'
    imul eax, 10
    add eax, edx
    inc ecx
    jmp .circle
.return:
    ; восстанавливаем регистры
    pop edx
    pop ecx
    pop ebx
    mov esp, ebp
    pop ebp
    ret 4

; Переводит число в строку
; Аргументы: число [esp + 4], адрес буфера [esp + 8]
; Возвращает: длину строки в eax
num2str:
    ; сохраняем регистры
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    push edi

    mov eax, [ebp + 8]      ; число
    mov edi, [ebp + 12]     ; адрес буфера
    mov ecx, 0              ; счетчик цифр
    mov ebx, 10             ; делитель
    ; получаем цифры в обратном порядке
.get_digits:
    xor edx, edx
    div ebx
    add dl, '0'
    push edx
    inc ecx
    test eax, eax
    jnz .get_digits
    mov edx, ecx         ; сохраняем длину
    ; записываем цифры в правильном порядке
.write_digits:
    pop eax
    mov [edi], al
    inc edi
    loop .write_digits
    mov byte [edi], 0    ; завершающий нуль
    mov eax, edx         ; возвращаем длину

    ; восстанавливаем регистры
    pop edi
    pop edx
    pop ecx
    pop ebx
    mov esp, ebp
    pop ebp
    ret 8

; Подсчет суммы цифр числа
; Аргументы: число [esp + 4]
; Возвращает: сумма цифр в eax
sum_digits:
    ; сохраняем регистры
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov eax, [ebp + 8]  ; число
    xor ebx, ebx        ; обнуляем сумму
    mov ecx, 10
.sum_loop:
    xor edx, edx
    div ecx             ; edx = eax % 10, eax = eax / 10
    add ebx, edx        ; добавляем цифру к сумме
    test eax, eax
    jnz .sum_loop
    mov eax, ebx        ; возвращаем сумму
    ; восстанавливаем регисры
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret 4

; Подсчет произведения цифр числа
; Аргументы: число [esp + 4]
; Возвращает: произведение цифр в eax
prod_digits:
    ; сохраняем регистры
    push ebp
    mov ebp, esp
    push ebx
    push ecx
    push edx
    mov eax, [ebp + 8]  ; число
    mov ebx, 1          ; произведение начинается с 1
    mov ecx, 10
.prod_loop:
    xor edx, edx
    div ecx             ; edx = eax % 10, eax = eax / 10
    imul ebx, edx       ; умножаем произведение на цифру
    test eax, eax
    jnz .prod_loop
    mov eax, ebx        ; возвращаем произведение
.end_prod:
    ; восстанавливаем регисры
    pop edx
    pop ecx
    pop ebx
    pop ebp
    ret 4


; --- НАЧАЛО ПРОГРАММЫ ---

_start:
    ; Считываем количество чисел
    PrintString prompt1, prompt1_len    ; Приглашение ввода
    InputString buffer, buflen          ; Считывание строки
    ; Переводим строку в число
    ; и сохраняем в count
    push buffer
    call str2num
    mov [count], eax            
    
    ; Считываем сами числа
    PrintString prompt2, prompt2_len    ; Приглашение ввода
.circle:
    ; Если считали все числа выходим из цикла
    cmp dword [count], 0
    jbe .end_circle
    ; Иначе уменьшаем значение счётчика
    sub dword [count], 1
    
    ; Считываем очередное число, сохраняем в number
    PrintString prompt3, prompt3_len
    InputString buffer, buflen
    push buffer
    call str2num
    mov [number], eax

    ; Считаем сумму цифр
    push dword [number]
    call sum_digits
    mov [sum], eax

    ; Считаем произведение цифр
    push dword [number]
    call prod_digits
    mov [prod], eax

    ; Находим модуль разности между этими значениями
    mov eax, [sum]
    mov ebx, [prod]
    cmp eax, ebx
    ja .diff_sum
    sub ebx, eax
    mov [diff], ebx
    jmp .diff_end
.diff_sum:
    sub eax, ebx
    mov [diff], eax
.diff_end:

    ; Затем выводим ответ для данного числа
    ; Выводим сумму (переводим в строку и выводим)
    push dword buffer
    push dword [sum]
    call num2str
    mov [len], eax
    PrintString buffer, [len]
    PrintSpace
    ; Выводим произведение (переводим в строку и выводим)
    push dword buffer
    push dword [prod]
    call num2str
    mov [len], eax
    PrintString buffer, [len]
    PrintSpace
    ; Выводим модуль разности (переводим в строку и выводим)
    push dword buffer
    push dword [diff]
    call num2str
    mov [len], eax
    PrintString buffer, [len]  ; выводим результат
    NewLine
    jmp .circle

.end_circle:
    ; Выход из программы
    Exit
