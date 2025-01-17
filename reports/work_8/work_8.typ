#import "../title_page_template.typ": title_page
#import "../layouts.typ": *

#set text(font: "New Computer Modern", size: 14pt)
#set page(margin: 2cm, paper: "a4")
#set heading(numbering: "1.")
#set figure(supplement: [Рисунок])
#set figure.caption(separator: [ -- ])

#title_page(8, [Стек и очередь])

#un_heading([Оглавление])

#outline(
  title: none
)

#set par(justify: true, first-line-indent: 1.25cm)

#pagebreak()

#set page(numbering: "1")

#head1([= Условие задачи])

#par(
	[
		#indent Требуется выполнить два задания.
	]
)

#par(
	[
		Первое задание не требует разработки кода, его цель в изучении АТД алгоритмов применения стека и очереди в задачах преобразования выражений из одной формы в другую. 
		Требуется решить три задачи.
	]
)

#par(
	[
		Приведены образцы оформления решения каждой задачи. 
		Теоретический материал по алгоритмам преобразования арифметического выражения, представленного в строковом формате, из инфиксной формы в польскую постфиксную или префиксную.
	]
)

#par(
	[
		Во втором задании требуется разработать программу вычисления значения арифметического выражения, представленного в одной из трех форм.
	]
)

#head1([= Постановка задачи])

#par(
  [#indent Задания моего персонального варианта (№22):]
  )

#par(
  [*Задание 1.* Выполнить четыре задачи, определенные вариантом задания 1. 
	Варианты задач представлены в таблице 18.]
)

#par(
  [*Задание 2.* Дано арифметическое выражение в нотации, указанной в варианте, представленное в строковом формате.
Разработать программу выполнения задачи варианта. Структура представления стека или очереди определена вариантом.]
)

#pagebreak()

#head1([= Задание 1])

#head2([== Подзадание 1])

#par(
	[
		#indent Выполнить преобразование инфиксной записи выражения  в постфиксную нотацию, расписывая процесс по шагам.
	]
)

#par(
	[
		_Исходное выражение (согласно варианту, 22 строка 1 столбца таблицы 18):_ 
		$ S = "z^(y+x)/m/n*(k-p)" $ 
	]
)

#par(
	[
		#indent Приведем решение задачи в виде последовательности выкладок. Результат выкладок будем записывать в строку $S_1$, а операторы -- в стек $W$.
	]
)

#let state(s1, w) = {
	text([$S_1$: #s1 \ $W$: #w])
}

#par(
	enum(
		[Добавим операнд z в строку $S_1$ \ #state([z], [])],
		[Добавим оператор ^ в стек $W$ \ #state([z], [^])],
		[Добавим открывающую скобку в стек $W$ \ #state([z], [^(])],
		[Добавим операнд y в строку $S_1$ \ #state([zy], [^(])],
		[Добавим оператор + в стек $W$ \ #state([zy], [^(+])],
		[Добавим операнд x в строку $S_1$ \ #state([zyx], [^(+])],
		[Текущий символ равен закрывающей скобке, значит извлекаем все операторы из стека $W$ до открывающей скобки и помещаем в строку $S_1$ \ #state([zyx+], [^])],
		[Извлечем оператор ^ из стека $W$ и добавим в строку $S_1$ \ #state([zyx+^], [])],
		[Добавим оператор / в стек $W$ \ #state([zyx+^], [/])],
		[Добавим операнд m в строку $S_1$ \ #state([zyx+^m], [/])],
		[Добавим оператор / в стек $W$ \ #state([zyx+^m], [\//])],
		[Извлечем из стека $W$ оператор / и добавим его в строку $S_1$ \ #state([zyx+^m/], [/])],
		[Добавим операнд n в строку $S_1$ \ #state([zyx+^m/n], [/])],
		[Извлечем оператор / из стека $W$ и добавим в строку $S_1$ \ #state([zyx+^m/n/], [])],
		[Добавим оператор \* в cтек $W$ \ #state([zyx+^m/n/], [\*])],
		[Добавим открывающую скобку в стек $W$ \ #state([zyx+^m/n/], [\*(])],
		[Добавим операнд k в строку $S_1$ \ #state([zyx+^m/n/k], [\*(])],
		[Добавим оператор - в стек $W$ \ #state([zyx+^m/n/k], [\*(-])],
		[Добавим операнд p в строку $S_1$ \ #state([zyx+^m/n/kp], [\*(])],
		[Текущий символ равен закрывающей скобке, значит извлекаем все операторы из стека $W$ до открывающей скобки и помещаем в строку $S_1$ \ #state([zyx+^m/n/kp-], [\*])],
		[Извлечем из стека $W$ оператор \* и добавим его в строку $S_1$ \ #state([zyx+^m/n/kp-\*], [])]
	)
)

#par(
	[
		#indent Преобразование завершено, поскольку стек $W$ пуст. Полученная строка $S_1 = "zyx+^m/n/kp-*"$ представляет собой постфиксную форму записи исходного инфиксного выражения.
	]
)

#head2([== Подзадание 2])

#par(
	[
		#indent Представить инфиксную нотацию выражения с расстановкой скобок, расписывая процесс по шагам.
	]
)

#par(
	[
		_Исходное выражение (согласно варианту, 22 строка 2 столбца таблицы 18):_ 
		$ S = "afbc*-zx-/y++" $ 
	]
)

#par(
	[
		#indent Приведем решение задачи в виде таблицы (см. табл. 1). Результат решения запишем в строку $S_1$.
	]
)

#par(
	first-line-indent: 0cm,
	[
		Таблица 1 -- Решение позадания 2
	]
)

#figure(
	table(
		columns: 2,
		align: (left, center),
		table.header(
			[Стек операндов], 
			[Операция (операнд) исходного выражения]
		),

		[a], [a],
		[af], [f],
		[afb], [b],
		[afbc], [c],
		[af(b*c)], [\*],
		[a(f-b*c)], [-],
		[a(f-b*c)z], [z],
		[a(f-b*c)zx], [x],
		[a(f-b*c)(z-x)], [-],
		[a(f-b*c)/(z-x)], [/],
		[a(f-b*c)/(z-x)y], [y],
		[a((f-b*c)/(z-x))+y], [+],
		[a+(((f-b*c)/(z-x))+y)], [+]
	)
)

#par(
	[
		#indent Преобразование завершено. Полученная строка $S_1 = "a+(((f-b*c)/(z-x))+y)"$ представляет собой инфиксную форму записи исходного постфиксного выражения.
	]
)

#pagebreak()

#head2([== Подзадание 3])

#par(
	[
	#indent Представить префиксную нотацию выражения, полученного в результате выполнения задачи 2, расписывая процесс по шагам.
	]
)

#par(
	[
		Приведем решение позадания в виде последовательности выкладок. 
	]
)

#enum(
	[Преобразуем самое вложенное выражение в префиксную форму: f-b*c = -f*bc. 
	Подставим полученное выражение обратно в исходную строку: a+(((-f*bc)/(z-x))+y).],
	[Аналогично преобразуем z-x: -zx. Подставим полученное в исходную строку: a+(((-f*bc)/-zx)+y).],
	[Аналогично преобразуем выражение (-f*bc)/-zx = /-f*bc-zx. Подставим полученное в исходную строку: a + ((/-f*bc-zx) + y).],
	[Аналогично преобразуем выражение (/-f*bc-zx) + y = +/-f*bc-zxy. Подставим результат в исходную строку: a+(+/-f*bc-zxy).],
	[Аналогично преобразуем выражение: +a+/-f*bc-zxy.]
)

#par(
	[
		#indent Полученное выражение +a+/-f*bc-zxy является префиксной формой записи инфиксного выражения, полученного в подзадании 2. 
	]
)

#head2([== Подзадание 4])

#par(
	[
		#indent Вычислить значение выражения.
	]
)

#par(
	[
		_Исходное выражение (согласно варианту, 22 строка 3 столбца таблицы 18):_
		$ S = "-+3+5,1/*2,4^1+2,6" $ 
	]
)

#par(
	[
		#indent Приведем решение подзадания 4 в виде последовательности выкладок. Начнем с самого внешнего оператора и будем двигаться внутрь
	]
)

#par(
	enum(
		[Самый внешний оператор --- -.],
		[Разберем выражение +3+5,1. Поскольку все операторы являются плюсами, просто найдем сумму всех чисел: $3+5+1=9$.],
		[Далее разберем оставшееся выражение /\*2,4^1+2,6.
		Самая вложенная операция --- +2,6 = $2+6=8$. 
		Далее по вложенности следует операция ^1,8 (8 -- результат сложения на предыдущем шаге). 
		^1,8 = $1 ^ 8 = 1$. 
		Затем следует операция \*2,4 = $2 dot 4 = 8$. 
		Последняя операция -- частное (/) результатов, полученных на последнем и предпоследнем шагах соответственно: /8,1 = $8 div 1 = 8$],
		[Остается последняя операция --- разность результатов, полученных после выполнения шагов 2 и 3 соответственно: -9,8 = $9 - 8 = 1$.]
	)
)

#par(
	[#indent В результате вычислений получим ответ: 1.]
)

#pagebreak()

#head1([= Задание 2])

#par(
	[
		#indent Дано арифметическое выражение в постфиксной нотации, представленное в строковом формате.
		Разработать программу выполнения задачи варианта. 
		В качестве структуры данных использовать стек, реализованный на основе линейного списка.
	]
)

#head2([== АТД задачи])

#head2([== #raw("Stack")])

#let tab(theme) = {
  set par(first-line-indent: 1.25cm, hanging-indent: 1.25cm)
  text([#theme #linebreak()])
}

#let method(num, head, pre, post, header) = {
  par(hanging-indent: 1.25cm, first-line-indent: 1.25cm, [
    #num #head #linebreak()
    Предусловие: #pre #linebreak()
    Постусловие: #post #linebreak()
    Заголовок: #header #linebreak()
  ])
}

#par(
	[
		АТД Stack \ { \
		#tab([_Данные_ (описание свойств структуры данных задачи)])
		#tab([top -- указатель на вершину стека])

		#tab([_Операции_ (объявления операций)])
		#method(
			[1.],
			[Метод, создающий пустой стек],
			[нет],
			[пустой стек],
			[#raw("Stack()")]
		)

		#method(
			[2.],
			[Метод, осуществляющий добавление элемента на вершину стека],
			[value -- значение нового элемента],
			[обновленный стек],
			[#raw("void push(int value)")]
		)

		#method(
			[3.],
			[Метод, осуществляющий удаление элемента с вершины стека],
			[исходный стек],
			[обновленный стек],
			[#raw("void pop()")]
		)

		#method(
			[4.],
			[Метод, осуществляющий считывание значения элемента, находящегося на вершине стека],
			[исходный стек],
			[значение элемента, находящегося на вершине стека],
			[#raw("int peek()")]
		)

		#method(
			[5.],
			[Метод, осуществляющий проверку стека на пустоту],
			[исходный стек],
			[#raw("true"), если стек пуст, иначе #raw("false")],
			[#raw("bool empty()")]
		) \
		}
	]
)

#head2([== #raw("Element")])

#par(
	[
		АТД Element \ { \
		#tab([_Данные_ (описание свойств структуры данных задачи)])
		#tab([value -- значение текущего элемента стека])
		#tab([next -- указатель на следующий элемент стека])
		
		#tab([_Операции_ (объявления операций)])
		#method(
			[1.],
			[Метод, создающий элемент стека],
			[value -- значение элемента стека],
			[элемент стека],
			[#raw("Element(int value)")]
		) \
		}
	]
)

#head2([== Код реализации АТД])

#par([1. Код файла #raw("stack.h")])

#let stack_h = read("../../src/work_8/headers/stack.h")
#raw(stack_h, lang: "cpp")

#par([2. Код файла #raw("stack.cpp")])

#let stack_cpp = read("../../src/work_8/source/stack.cpp")
#raw(stack_cpp, lang: "cpp")

#par([3. Код файла #raw("element.h")])

#let element_h = read("../../src/work_8/headers/element.h")
#raw(element_h, lang: "cpp")

#par([4. Код файла #raw("element.cpp")])

#let element_cpp = read("../../src/work_8/source/element.cpp")
#raw(element_cpp, lang: "cpp")

#head2([== Код основной программы])

#par([1. Код файла #raw("main.cpp")])

#let main = read("../../src/work_8/main.cpp")
#raw(main, lang: "cpp")

#par([2. Код файла #raw("operations.cpp")])

#let operations = read("../../src/work_8/source/operations.cpp")
#raw(operations, lang: "cpp")

#head2([== Тестирование])

#par(
	[
		#indent *Тест №1.* Входная строка: 8,2,5\*+4,3,2\*-4-/. Ожидаемые выходные данные: "Ответ: -3"
	]
)

#figure(
	image(
		"image/test1.png",
		width: 60%
	),

	caption: [Результаты теста №1]
)

#pagebreak()

#par(
	[
		#indent *Тест №2.* Входная строка: 4,8,2\*-5+. Ожидаемые выходные данные: "Ответ: -7"
	]
)

#figure(
	image(
		"image/test2.png",
		width: 60%
	),

	caption: [Результаты теста №1]
)

#par(
	[
		#indent *Тест №3.* Входная строка: 2,2,1+^4/2/9,6-\*. Ожидаемые выходные данные: "Ответ: 3"
	]
)

#figure(
	image(
		"image/test3.png",
		width: 60%
	),

	caption: [Результаты теста №3]
)

#pagebreak()

#head1([= Выводы])

#par(
	[
		#indent В результате выполнения работы были получены знания и навыки по реализации структуры стек и очередь,
		выполнению операций управления стеком и очередью,
		практическому применению стека и очереди при вычислении значения арифметического выражения и преобразования арифметических выражений из инфиксной нотации в польскую нотацию.
	]
)
