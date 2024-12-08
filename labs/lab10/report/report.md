---
## Front matter
title: "Отчёт по лабораторной работе №10"
subtitle: "дисциплина Архитектура компьютера"
author: "Терещенкова Маргарита Владимировна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Приобретение навыков написания программ для работы с файлами.

# Задание

1. Создание файлов в программах
2. Изменение прав на файлы для разных групп пользователей
3. Выполнение самостоятельных заданий по материалам лабораторной работы.

# Теоретическое введение

ОС GNU/Linux является многопользовательской операционной системой. И для обеспечения защиты данных одного пользователя от действий других пользователей существуют специальные механизмы разграничения доступа к файлам. Кроме ограничения доступа, данный механизм позволяет разрешить другим пользователям доступ данным для совместной работы.

В операционной системе Linux существуют различные методы управления файлами, например, такие как создание и открытие файла, только для чтения или для чтения и записи, добавления в существующий файл, закрытия и удаления файла, предоставление прав доступа. 

Обработка файлов в операционной системе Linux осуществляется за счет использования определенных системных вызовов. Для корректной работы и доступа к файлу при его открытии или создании, файлу присваивается уникальный номер (16-битное целое число) дескриптор файла.

# Выполнение лабораторной работы

1. Создаю каталог для программам лабораторной работы № 10, перехожу в него и создаю файлы lab10-1.asm, readme-1.txt и readme-2.txt.

![Создание каталога и файлов](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo1.jpg){#fig:001 width=70%}

2. Ввожу в файл lab10-1.asm текст программы из листинга 10.1.

![Редактирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo2.jpg){#fig:002 width=70%}

Создаю исполняемый файл.

![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo3.jpg){#fig:003 width=70%}

3. С помощью команды chmod изменяю права доступа к исполняемому файлу lab10-1, запретив его выполнение. Пытаюсь выполнить файл.

![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo4.jpg){#fig:004 width=70%}

В результате выполнения отказано в доступе, и при написании команды ls -l, в правом поле (-rw-rw-r--) показывает, что файл больше не имеет права на выполнение (x исчезло). Ошибка возникает, потому что права на выполнение файла были удалены. Когда права на выполнение (execute) отсутствуют, операционная система запрещает запускать файл, даже если это действительный исполняемый файл.

4. С помощью команды chmod изменяю права доступа к файлу lab10-1.asm с исходным текстом программы, добавив права на исполнение. Пытаюсь выполнить его.

![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo5.jpg){#fig:005 width=70%}

Файл выполняется. Также можно заметить, что у файлов lab10-1 и lab10-1.asm есть флаг x (execute), указывающий, что файл может быть исполнен.

5. В соответствии с вариантом в таблице 10.4, мой вариант - 4, предоставляю права доступа к файлу readme- 1.txt представленные в символьном виде, а для файла readme-2.txt – в двочном виде. Проверяю правильность выполнения с помощью команды ls -l.

- Для **readme-1.txt**:

• **u=w** — оставляю только запись для владельца

• **g=** — убираю все права для группы

• **o=w** — оставляю только запись для остальных

- Для **readme-2.txt**:

Преобразую в восьмеричный формат:

• **001** (владелец) → 1 (только выполнение)

• **011** (группа) → 3 (запись и выполнение)

• **110** (остальные) → 6 (чтение и запись)
 
![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo6.jpg){#fig:006 width=70%}

Права доступа выданы верно.

# Выполнение заданий для самостоятельной работы

Создаю файл lab10-2.asm и пишу программу по заданию.

![Создание файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo7.jpg){#fig:007 width=70%}

![Написание программы](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo8.jpg){#fig:008 width=70%}

Cоздаю объектный файл и запускаю программу.

![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 10/архив 10/photo9.jpg){#fig:009 width=70%}

Программа работает корректно.

**Код программы:**

SECTION .data

prompt db "Как Вас зовут?", 10

prompt_len equ $ - prompt 

output_msg db "Меня зовут ", 0

output_msg_len equ $ - output_msg 

filename db "name.txt", 0

SECTION .bss

name resb 64 

SECTION .text

global _start

_start:

mov eax, 4 

mov ebx, 1 

mov ecx, prompt

mov edx, prompt_len

int 0x80 

mov eax, 3 

mov ebx, 0

mov ecx, name

mov edx, 64

int 0x80 

mov eax, 5

mov ebx, filename

mov ecx, 0101b

mov edx, 0644

int 0x80

mov edi, eax

mov eax, 4

mov ebx, edi

mov ecx, output_msg

mov edx, output_msg_len

int 0x80

mov eax, 4

mov ebx, edi

mov ecx, name

mov edx, 64

int 0x80

mov eax, 6

mov ebx, edi

int 0x80

mov eax, 1

xor ebx, ebx

int 0x80

# Выводы

Благодаря данной лабораторной работе приобрела навыки написания программ для работы с файлами.

# Список литературы{.unnumbered}

1. Архитектура компьютера
