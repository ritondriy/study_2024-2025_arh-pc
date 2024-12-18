---
## Front matter
title: "Отчёт по лабораторной работе № 4"
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
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Освоение процедуры компиляции и сборки программ, написанных на ассемблере NASM.

# Задание

    1. Создание программы Hello world!
    2. Работа с транслятором NASM
    3. Работа с расширенным синтаксисом командной строки NASM
    4. Работа с компоновщиком LD
    5. Запуск исполняемого файла
    6. Выполнение заданий для самостоятельной работы.

# Теоретическое введение

Основными функциональными элементами любой ЭВМ являются центральный процессор, память и периферийные устройства. Взаимодействие этих устройств осуществляется через общую шину, к которой они подключены. Физически шина представляет собой большое количество проводников, соединяющих устройства друг с другом. В современных компьютерах проводники выполнены в виде электропроводящих дорожек на материнской плате. Основной задачей процессора является обработка информации, а также организация координации всех узлов компьютера. В состав центрального процессора входят следующие устройства: - арифметико-логическое устройство (АЛУ) — выполняет логические и арифметические действия, необходимые для обработки информации, хранящейся в памяти; - устройство управления (УУ) — обеспечивает управление и контроль всех устройств компьютера; - регистры — сверхбыстрая оперативная память небольшого объёма, входящая в состав процессора, для временного хранения промежуточных результатов выполнения инструкций; регистры процессора делятся на два типа: регистры общего назначения и специальные регистры. Для того, чтобы писать программы на ассемблере, необходимо знать, какие регистры процессора существуют и как их можно использовать. Большинство команд в программах написанных на ассемблере используют регистры в каче- стве операндов. Практически все команды представляют собой преобразование данных хранящихся в регистрах процессора, это например пересылка данных между регистрами или между регистрами и памятью, преобразование (арифметические или логические операции) данных хранящихся в регистрах. Доступ к регистрам осуществляется не по адресам, как к основной памяти, а по именам. Каждый регистр процессора архитектуры x86 имеет свое название, состоящее из 2 или 3 букв латинского алфавита. В качестве примера приведем названия основных регистров общего назначения (именно эти регистры чаще всего используются при написании программ): - RAX, RCX, RDX, RBX, RSI, RDI — 64-битные - EAX, ECX, EDX, EBX, ESI, EDI — 32-битные - AX, CX, DX, BX, SI, DI — 16-битные - AH, AL, CH, CL, DH, DL, BH, BL — 8-битные

Другим важным узлом ЭВМ является оперативное запоминающее устройство (ОЗУ). ОЗУ — это быстродействующее энергозависимое запоминающее устройство, которое напрямую взаимодействует с узлами процессора, предназначенное для хранения программ и данных, с которыми процессор непосредственно работает в текущий момент. ОЗУ состоит из одинаковых пронумерованных ячеек памяти. Номер ячейки памяти — это адрес хранящихся в ней данных. Периферийные устройства в составе ЭВМ: - устройства внешней памяти, которые предназначены для долговременного хранения больших объёмов данных. - устройства ввода-вывода, которые обеспечивают взаимодействие ЦП с внешней средой.

В основе вычислительного процесса ЭВМ лежит принцип программного управления. Это означает, что компьютер решает поставленную задачу как последовательность действий, записанных в виде программы.

Коды команд представляют собой многоразрядные двоичные комбинации из 0 и 1. В коде машинной команды можно выделить две части: операционную и адресную. В операционной части хранится код команды, которую необходимо выполнить. В адресной части хранятся данные или адреса данных, которые участвуют в выполнении данной операции. При выполнении каждой команды процессор выполняет определённую последовательность стандартных действий, которая называется командным циклом процессора. Он заключается в следующем: 1. формирование адреса в памяти очередной команды; 2. считывание кода команды из памяти и её дешифрация; 3. выполнение команды; 4. переход к следующей команде.

Язык ассемблера (assembly language, сокращённо asm) — машинно-ориентированный язык низкого уровня. NASM — это открытый проект ассемблера, версии которого доступны под различные операционные системы и который позволяет получать объектные файлы для этих систем. В NASM используется Intel-синтаксис и поддерживаются инструкции x86-64.


# Выполнение лабораторной работы

## Создание программы Hello world!

С помощью утилиты cd перемещаюсь в каталог, в котором буду работать. Создаю в текущем каталоге пустой текстовый файл hello.asm с помощью утилиты touch.

![*Перемещение между директориями. Создание пустого файла.*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение1.jpg){#fig:001 width=70%}

Открываю созданный файл в текстовом редакторе mousepad.Заполняю файл, вставляя в него программу для вывода “Hello word!”

![*Заполнение файла*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение2.jpg){#fig:002 width=70%}

## Работа с транслятором NASM

Устанавливаем nasm с помощью sudo apt install nasm

![*Установка nasm*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение3.jpg){#fig:003 width=70%}

Превращаю текст программы для вывода “Hello world!” в объектный код с помощью транслятора NASM, используя команду nasm -f elf hello.asm, ключ -f указывает транслятору nasm, что требуется создать бинарный файл в формате ELF. Далее проверяю правильность выполнения команды с помощью утилиты ls: файл “hello.o” создан.

![*Компиляция текста программы*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение4.jpg){#fig:004 width=70%}

## Работа с расширенным синтаксисом командной строки NASM

Ввожу команду, которая скомпилирует файл hello.asm в файл obj.o, при этом в файл будут включены символы для отладки (ключ -g), также с помощью ключа -l будет создан файл листинга list.lst . Далее проверяю с помощью утилиты ls правильность выполнения команды.

![*Компиляция текста программы*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение5.jpg){#fig:005 width=70%}

## Компоновщик LD

Передаю объектный файл hello.o на обработку компоновщику LD, чтобы получить исполняемый файл hello . Ключ -о задает имя создаваемого исполняемого файла. Далее проверяю с помощью утилиты ls правильность выполнения команды.

![*Передача объектного файла на обработку компоновщику*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение6.jpg){#fig:006 width=70%}

Выполняю команду ld -m elf_i386 obj.o -o main . Исполняемый файл будет иметь имя main, т.к. после ключа -о было задано значение main. Объектный файл, из которого собран этот исполняемый файл, имеет имя obj.o

![*Передача объектного файла на обработку компоновщику*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение7.jpg){#fig:007 width=70%}

## Запуск исполняемого файла

Запускаю на выполнение созданный исполняемый файл hello

![*Запуск исполняемого файла*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение8.jpg){#fig:008 width=70%}

# Выполнение заданий для самостоятельной работы.

С помощью утилиты cp создаю в текущем каталоге копию файла hello.asm с именем lab4.asm

![*Создание копии файла*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение9.jpg){#fig:009 width=70%}

С помощью текстового редактора mousepad открываю файл lab4.asm и вношу изменения в программу так, чтобы она выводила мои имя и фамилию. 

![*Изменение программы*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение10.jpg){#fig:010 width=50%}

Компилирую текст программы в объектный файл. Проверяю с помощью утилиты ls, что файл lab4.o создан.

![*Компиляция текста программы*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение11.jpg){#fig:011 width=70%}

Передаю объектный файл lab4.o на обработку компоновщику LD, чтобы получить исполняемый файл lab4

![*Передача объектного файла на обработку компоновщику*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение12.jpg){#fig:012 width=70%}

Запускаю исполняемый файл lab4, на экран выводятся мои имя и фамилия 

![*Запуск исполняемого файла*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение13.jpg){#fig:013 width=70%}

# Исправление ошибки

По привычке я начала работу не в том каталоге, поэтому создаю директорию lab04 с помощью mkdir (как указано в порядке выполнения лабораторной работы) Далее копирую из текущего каталога файлы, созданные в процессе выполнения лабораторной работы, с помощью утилиты cp, указывая вместо имени файла символ *, чтобы скопировать все файлы. Команда проигнорирует директории в этом каталоге, т. к. не указан ключ -r, это мне и нужно . Проверяю с помощью утилиты ls правильность выполнения команды. 

![*Создании директории*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение14.jpg){#fig:014 width=70%}

![*Создании копии файлов в новом каталоге*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение15.jpg){#fig:015 width=70%}

Удаляю лишние файлы в текущем каталоге с помощью утилиты rm, ведь копии файлов остались в другой директории.

![*Проверка удаления*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение16.jpg){#fig:016 width=70%}

С помощью команд git add . и git commit добавляю файлы на GitHub, комментируя действие как добавление файлов для лабораторной работы.

![*Добавление файлов на GitHub*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение17.jpg){#fig:017 width=70%}

Отправляю файлы на сервер с помощью команды git push

![*Отправка файлов*](/home/mvtereshenkova/Рабочий стол/rudn/архитектура компьютеров/лаба 4/л4 изображение18.jpg){#fig:018 width=70%}

# Выводы

Благодаря данной лаборатоной работе освоила процедуры компиляции и сборки программ, написанных на ассемблере NASM.

# Список литературы{.unnumbered}
1. Архитектура ЭВМ

::: {#refs}
:::
