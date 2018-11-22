# Идея

Только **поведение**! 


Прототип должен быть свободен от объектов метаданных (справочник или регистр сведений, дерево значений или динамический список с группировками - решает разработчик). В то же время ожидаю, что ограничение в элементах управления (только элементы управления 1С) даст экономию времени как на само прототипирование так и на разработку, а так же снизит нагрузку на систему.

# Поддерживаемые типы реквизитов формы

* Число
* Строка
* Дата
* Булево
* ТаблицаЗначений
* ДеревоЗначений
* ТабличныйДокумент
* ТекстовыйДокумент
* ФорматированнаяСтрока
* ФорматированныйДокумент
* Картинка
* СтандартныйПериод

# Страктура проекта

```
Проект <Структура>
	∟ Формы <Массив>
	|	∟ Форма <Структура>
	|		∟ Прототип <Строка>
	|		∟ Элементы <Массив>
	|		|	∟ Элемент <Структура>
	|		|		∟ Свойства <Массив>
	|		|		|	∟ Свойство <Структура>
	|		|		|		∟ Имя <Строка>
	|		|		|		∟ Значение <Строка>
	|		|		|			∟...
	|		|		|
	|		|		∟ События <Массив>
	|		|		|	∟ Событие <Структура>
	|		|		|		∟ Имя <Строка>
	|		|		|		∟ Обработчик <...>
	|		|		|
	|		|		∟ Данные <Массив>
	|		|		|	∟... 
	|		|		|
	|		|		∟ ДочерниеЭлементы <Массив>
	|		|			∟ Элемент <Структура>
	|		|				∟...
	|		|
	|		∟ Свойства <Массив>
	|		|	∟ Свойство <Структура>
	|		|		∟ Имя <Строка>
	|		|		∟ Значение <Строка>
	|		|			∟...
	|		|
	|		∟ События <Массив>
	|			∟ Событие <Структура>
	|				∟ Имя <Строка>
	|				∟ Обработчик <...>
	|
	∟ Роли <Массив>
	|	∟ Роль <Структура>
	|		∟ Имя <Строка>
	|		∟ Зависимости <Массив>
	|			∟ Зависимость <Структура>
	|				∟ Форма <Строка>
	|				∟ Элемент <Строка>
	|				∟ Видимость <Булево>
	|				∟ Доступность <Булево>
	|
	∟ ТехническаяИнформация <Структура>
		∟ Версия <Строка>
```