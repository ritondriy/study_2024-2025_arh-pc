---
## Front matter
title: "Отчёт по лабораторной работе №3"
subtitle: "дисциплина:	Архитектура компьютера"
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
lot: true # List of tables
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
tableTitle: "Таблица"
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

Целью работы является освоение процедуры оформления отчетов с помощью легковесного языка разметки Markdown.



# Задание

    1. Установка необходимого ПО
    2. Заполнение отчета по выполнению лабораторной работы №3 
    3. Задание для самостоятельной работы

# Теоретическое введение

Markdown - легковесный язык разметки, созданный с целью обозначения форматирования в простом тексте, с максимальным сохранением 
его читаемости человеком, и пригодный для машинного преобразования в языки для продвинутых публикаций. Внутритекстовые формулы делаются аналогично формулам LaTeX. В Markdown вставить изображение в документ можно с помощью непосредственного указания адреса изображения. Синтаксис Markdown для встроенной ссылки состоит из части [link text], представляющей текст гиперссылки, и части (file-name.md) – URL-адреса или имени файла, на который дается ссылка. Markdown поддерживает как встраивание фрагментов кода в предложение, так и их размещение между предложениями в виде отдельных огражденных блоков. Огражденные блоки кода — это простой способ выделить синтаксис для фрагментов кода.

# Выполнение лабораторной работы

## Установление необходимого ПО

### Установка TexLive

Скачала TexLive.

![Скачивание TexLive](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение1.jpg){#fig:001 width=70%}

### Установка Pandoc

Скачала Pandoc с официального сайта.

![Скачивание Pandoc](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение2.jpg){#fig:002 width=70%}

## Заполнение отчета по выполнению лабораторной работы №3 с помощью языка разметки Markdown

Открываю терминал. Перехожу в каталог курса, сформированный при выполненнии прошлой лаборатной работы. Обновляю локальный репозиторий, скачав изменения из удаленного репозитория с помощью команды git pull

![Перемещение между директориями. Обновление локального репозитория](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение3.jpg){#fig:003 width=70%}

Перехожу в каталог с шаблоном отчета по лабораторной работе №3 с помощью cd. Компилирую шаблон с использованием Makefile, вводя команду make.

![Перемещение между директориями. Компиляция шаблона.](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение4.jpg){#fig:004 width=70%}

Проверяю наличие нужных файлов в папке.

![Проверка](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение5.jpg){#fig:005 width=70%}

Удаляю полученные файлы с использованием Makefile, вводя команду make clean. С помощью команды ls проверяю, удалились ли созданные файлы.

![Удаление файлов](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение6.jpg){#fig:006 width=70%}

Открываю файл report.md с помощью любого текстового редактора mousepad.

![Открытие файла report.md](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение7.jpg){#fig:007 width=70%}

Начинаю заполнять отчёт по данной лабораторной работе 

![Заполнение отчёта](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение8.jpg){#fig:008 width=70%}

Компилирую файл с отчетом. Загружаю отчет на GitHub.(Сделала также как в самостоятельной работе)

# Задание для самостоятельной работы

1) Перехожу в директорию lab02/report с помощью cd, чтобы там заполнять отчет по третьей лабораторной работе. Открываю файл с помощью текстового редактора gedit и начинаю заполнять отчет.

![Переход в директорию. Открытие файла с помощью текстового редактора gedit](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение9.jpg){#fig:009 width=70%}

![Начало заполнение отчёта](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение10.jpg){#fig:010 width=70%}

Компилирую файл с отчетом по лабораторной работе 

![Компиляция файлов](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение11.jpg){#fig:011 width=70%}

2) Добавляю изменения на GitHub с помощью комнады git add и сохраняю изменения с помощью commit. Отправлялю файлы на сервер с помощью команды git push.

![Добавление изменений и отправка файлов на GitHub](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 3/изображение12.jpg){#fig:012 width=70%}


# Выводы

Благодаря данной лабораторной работе освоили процедуры оформления отчетов с помощью легковесного языка разметки Markdown.

# Список литературы{.unnumbered}
1)Архитектура ЭВМ

::: {#refs}
:::
