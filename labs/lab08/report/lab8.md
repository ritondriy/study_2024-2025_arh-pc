---
## Front matter
title: "Отчёт по лабораторной работе №8"
subtitle: "Дисциплина: архитектура компьютеров"
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

Приобретение навыков написания программ с использованием циклов и обработкой аргументов командной строки.

# Задание

1. Реализация циклов NASM
2. Обработка аргументов командной строки
3. Задания для самостоятельной работы

# Теоретическое введение

Стек — это структура данных, организованная по принципу LIFO («Last In — First Out» или «последним пришёл — первым ушёл»). Стек является частью архитектуры процессора и
реализован на аппаратном уровне. Для работы со стеком в процессоре есть специальные регистры (ss, bp, sp) и команды. Основной функцией стека является функция сохранения адресов возврата и передачи аргументов при вызове процедур. Кроме того, в нём выделяется память для локальных переменных и могут временно храниться значения регистров.

Стек имеет вершину, адрес последнего добавленного элемента, который хранится в регистре esp (указатель стека). Противоположный конец стека называется дном. Значение, помещённое в стек последним, извлекается первым. При помещении значения в стек указатель стека уменьшается, а при извлечении — увеличивается.

Для стека существует две основные операции:

• добавление элемента в вершину стека (push);

• извлечение элемента из вершины стека (pop).

# Выполнение лабораторной работы

## Реализация циклов в NASM

Создала каталог для программ лабораторной работы № 8, перешла в него и создала файл lab8-1.asm:

![Создание каталога](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo1.jpg){#fig:001 width=70%}

Копирую в текущий каталог файл in_out.asm с помощью утилиты cp, так как он будет использоваться в других программах. И проверяю наличие файла в данной директории с помощью команды ls.

![Копирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo2.jpg){#fig:002 width=70%}

Ввожу в файл lab8-1.asm текст программы из листинга 8.1. 

![Редактирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo3.jpg){#fig:003 width=70%}

Создаю исполняемый файл и запускаю его.

![Запуск файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo4.jpg){#fig:004 width=70%}

Исполняемый файл работает корректно.

Меняю текст программы добавив изменение значение регистра ecx в цикле.

![Редактирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo5.jpg){#fig:005 width=70%}

Создаю исполняемый файл и запускаю его.

![Запуск файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo6.jpg){#fig:006 width=70%}

Данный пример показывает, что использование регистра ecx в теле цикла loop может привести к некорректной работе программы. Число проходов не соответствует значению N.

Вношу изменения в текст программы, добавив команды push и pop (добавления в стек и извлечения из стека) для сохранения значения счетчика цикла loop.

![Редактирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo7.jpg){#fig:007 width=70%}

Создаю исполняемый файл и запускаю его.

![Запуск файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo8.jpg){#fig:008 width=70%}

В данном случае число проходов цикла соответствует значению N.

## Обработка аргументов командной строки

Создаю файл с названием lab8-2.asm.

![Создание файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo9.jpg){#fig:009 width=70%}

Ввожу в него текст программы из листинга 8.2 

![Редактирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo10.jpg){#fig:010 width=70%}

Создаю исполняемый файл и запускаю его, указав аргументы.

![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo11.jpg){#fig:011 width=70%}

Программа обработала 3 аргумента. 

Создаю файл с названием lab8-3.asm.

![Создание файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo12.jpg){#fig:012 width=70%}

Ввожу в него текст программы из листинга 8.3 

![Редактирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo13.jpg){#fig:013 width=70%}

Создаю исполняемый файл и запускаю его, указав аргументы.

![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo14.jpg){#fig:014 width=70%}

Редактирую текст программы для вычисления произведения аргументов командной строки.

![Редактирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo15.jpg){#fig:015 width=70%}

Создаю исполняемый файл и запускаю его, указав аргументы.

![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo16.jpg){#fig:016 width=70%}

## Самостоятельная работа

Создаю файл lab8-4.asm.

![Создание файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo17.jpg){#fig:017 width=70%}

Начинаю написание программы, которая будет вычислять сумму значений f(x)=2(x-1).(вариант 4)

![Редактирование файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo18.jpg){#fig:018 width=70%}

Создаю исполняемый файл и запускаю его.

![Запуск исполняемого файла](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 8/архив 8/photo19.jpg){#fig:019 width=70%}

Произведя несложные математические вычисления, делаю вывод, что программа работает верно.

**Текст программы:**


%include “in_out.asm"

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

# Выводы

Благодаря данной лабораторной работе, приобрела навыки написания программ с использованием циклов и обработкой аргументов командной строки.

# Список литературы{.unnumbered}

1. Архитектура компьютеров
