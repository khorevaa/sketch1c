﻿
&НаКлиенте
Процедура АктивизироватьТекущийЭлементУправления(ИмяЭлемента) Экспорт
	ИскомыйЭлемент = ЭтаФорма.Элементы.Найти(ИмяЭлемента);
	Если ИскомыйЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ЭтотОбъект.ТекущийЭлемент = ИскомыйЭлемент;
	ЭтотОбъект.ОбновитьОтображениеДанных();
	
КонецПроцедуры


&НаКлиенте
Функция НарисоватьЭлементУправления(Тип, СвойстваЭлемента, Связать, Перемещение) Экспорт
	НарисоватьЭлементУправленияНаСервере(Тип, СвойстваЭлемента, Связать, Перемещение);
	ЭтаФорма.ОбновитьОтображениеДанных();
	
КонецФункции

&НаСервере
Функция НарисоватьЭлементУправленияНаСервере(Тип, СвойстваЭлемента, Связать, Перемещение)
	РодительЭлемента = СвойстваЭлемента.Родитель;
	Если ПустаяСтрока(РодительЭлемента) Тогда
		РодительЭлемента = Неопределено;
		
	Иначе
		РодительЭлемента = ЭтаФорма.Элементы[РодительЭлемента];
		
	КонецЕсли;
	
	Если Перемещение Тогда
		Элемент = СвойстваЭлемента.Элемент;
		Если ЗначениеЗаполнено(Элемент) Тогда
			Элемент =  ЭтаФорма.Элементы[Элемент];
			
		КонецЕсли;
		
		НовыйЭлемент = Этаформа.Элементы.Вставить(СвойстваЭлемента.Имя, Тип, РодительЭлемента, Элемент);
		
	Иначе
		НовыйЭлемент = Этаформа.Элементы.Добавить(СвойстваЭлемента.Имя, Тип, РодительЭлемента);
		
	КонецЕсли;
	
	Если Тип = Тип("КнопкаФормы") Тогда
		Если Связать Тогда
			ДобавитьКоманду(СвойстваЭлемента.Имя, "ОбработатьКоманду", СвойстваЭлемента.Заголовок);
			
		КонецЕсли;
		
		НовыйЭлемент.ИмяКоманды = СвойстваЭлемента.Имя;
		НовыйЭлемент.Вид = ВидКнопкиФормы[СвойстваЭлемента.Вид];
		НовыйЭлемент.КнопкаПоУмолчанию = СвойстваЭлемента.КнопкаПоУмолчанию;
		
	ИначеЕсли Тип = Тип("ПолеФормы") Тогда
		Если Связать Тогда
			ДобавитьРеквизит(СвойстваЭлемента.Имя, СвойстваЭлемента.ТипЗначения, СвойстваЭлемента.Путь);
			
		КонецЕсли;
		
		НовыйЭлемент.Вид = ВидПоляФормы[СвойстваЭлемента.Вид];
		НовыйЭлемент.ПутьКДанным = СвойстваЭлемента.ПутьКДанным;
		НовыйЭлемент.Заголовок = СвойстваЭлемента.Заголовок;
		
	ИначеЕсли Тип = Тип("ГруппаФормы") Тогда
		НовыйЭлемент.Вид = ВидГруппыФормы[СвойстваЭлемента.Вид];
		Если НовыйЭлемент.Вид = ВидГруппыФормы.ОбычнаяГруппа Тогда
			НовыйЭлемент.ОтображатьЗаголовок = СвойстваЭлемента.ОтображатьЗаголовок;
			НовыйЭлемент.Группировка = ГруппировкаПодчиненныхЭлементовФормы[СвойстваЭлемента.Группировка];

		ИначеЕсли НовыйЭлемент.Вид = ВидГруппыФормы.ГруппаКнопок Тогда
			НовыйЭлемент.Отображение = ОтображениеГруппыКнопок[СвойстваЭлемента.ОтображениеГруппыКнопок];

		КонецЕсли;
		
		НовыйЭлемент.Заголовок = СвойстваЭлемента.Заголовок;
		НовыйЭлемент.ВертикальноеПоложениеВГруппе = ВертикальноеПоложениеЭлемента.Центр;
		НовыйЭлемент.ГоризонтальноеПоложениеВГруппе = ГоризонтальноеПоложениеЭлемента.Авто;
		НовыйЭлемент.Видимость = Истина;
		НовыйЭлемент.Доступность = Истина;
		НовыйЭлемент.ОтображениеПодсказки = ОтображениеПодсказки.Авто;
		НовыйЭлемент.Подсказка = "";
		НовыйЭлемент.РастягиватьПоВертикали = Ложь;
		НовыйЭлемент.РастягиватьПоГоризонтали = Ложь;
		НовыйЭлемент.ТолькоПросмотр	= Ложь;
		
	ИначеЕсли Тип = Тип("ТаблицаФормы") Тогда
		Если Связать Тогда
			ДобавитьРеквизит(СвойстваЭлемента.Имя, СвойстваЭлемента.Тип);
			
		КонецЕсли;
		
		НовыйЭлемент.ПутьКДанным = СвойстваЭлемента.Имя;
		НовыйЭлемент.АвтоВводНовойСтроки = СвойстваЭлемента.АвтоВводНовойСтроки;
		НовыйЭлемент.ПоложениеЗаголовка = ПоложениеЗаголовкаЭлементаФормы[СвойстваЭлемента.ПоложениеЗаголовкаЭлементаФормы];
		
	КонецЕсли;
КонецФункции


&НаКлиенте
Функция СтеретьЭлементУправления(ИмяЭлемента, ИмяРеквизита = "", ЭтоКоманда = Ложь) Экспорт
	Результат = СтеретьЭлементУправленияНаСервере(ИмяЭлемента, ИмяРеквизита, ЭтоКоманда);
	ЭтаФорма.ОбновитьОтображениеДанных();
	
	Возврат Результат;
КонецФункции

&НаСервере
Функция СтеретьЭлементУправленияНаСервере(ИмяЭлемента, ИмяРеквизита, ЭтоКоманда)
	Результат = Ложь;
	
	ИскомыйЭлемент = ЭтаФорма.Элементы.Найти(ИмяЭлемента);
	Если ИскомыйЭлемент = Неопределено Тогда
		Возврат Результат;
	КонецЕсли;
	
	ЭтаФорма.Элементы.Удалить(ИскомыйЭлемент);
	
	Если ПустаяСтрока(ИмяРеквизита) Тогда
		Результат = Истина;
		
		Возврат Результат;
	КонецЕсли;
	
	Если ЭтоКоманда Тогда
		ИскомаяКоманда = ЭтаФорма.Команды.Найти(ИмяРеквизита);
		Если ИскомаяКоманда = Неопределено Тогда
			//todo
		Иначе
			ЭтаФорма.Команды.Удалить(ИскомаяКоманда);
			
			Результат = Истина;
			
		КонецЕсли;
	Иначе
		УдаляемыеРеквизиты = Новый Массив(1);
		УдаляемыеРеквизиты[0] = ИмяРеквизита;
		
		ИзменитьРеквизиты(, УдаляемыеРеквизиты);
		
		Результат = Истина;
		
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

&НаКлиенте
Процедура ПереместитьЭлементУправления(ДанныеПеремещения) Экспорт
	ПереместитьЭлементУправленияНаСервере(ДанныеПеремещения);
	ЭтаФорма.ОбновитьОтображениеДанных();
	
КонецПроцедуры

&НаСервере
Процедура ПереместитьЭлементУправленияНаСервере(ДанныеПеремещения)
	ПеремещаемыйЭлемент = Элементы.Найти(ДанныеПеремещения.ИмяПеремещаемогоЭлемента);
	
	Если ПустаяСтрока(ДанныеПеремещения.ИмяРодительскогоЭлемента) Тогда
		РодительскийЭлемент = ЭтотОбъект;
		
	Иначе
		РодительскийЭлемент = Элементы.Найти(ДанныеПеремещения.ИмяРодительскогоЭлемента);
		
	КонецЕсли;
	
	ЭлементМестоположения = Элементы.Найти(ДанныеПеремещения.ИмяЭлементаМесторасположения);
	
	Элементы.Переместить(ПеремещаемыйЭлемент, РодительскийЭлемент, ЭлементМестоположения); 

КонецПроцедуры


&НаКлиенте
Процедура ИзменитьСвойствоЭлементаУправления(Свойство, Значение, ЭтоФорма, ИмяЭлемента) Экспорт
	ИзменитьСвойствоЭлементаУправленияНаСервере(Свойство, Значение, ЭтоФорма, ИмяЭлемента);
	ЭтаФорма.ОбновитьОтображениеДанных();

КонецПроцедуры

&НаСервере
Функция ИзменитьСвойствоЭлементаУправленияНаСервере(Свойство, Значение, ЭтоФорма, ИмяЭлемента)
	Результат = Ложь;
	
	Если ЭтоФорма Тогда
		ЭтаФорма[Свойство] = Значение;
		
	Иначе
		ИскомыйЭлемент = ЭтаФорма.Элементы.Найти(ИмяЭлемента);
		Если ИскомыйЭлемент = Неопределено Тогда
			Возврат Результат;
		КонецЕсли;
		
		Если ТипЗнч(ИскомыйЭлемент) = Тип("ГруппаФормы") Тогда
			Если Свойство = "Группировка" Тогда
				ИскомыйЭлемент[Свойство] = ГруппировкаПодчиненныхЭлементовФормы[Значение];
				
			ИначеЕсли Свойство = "ОтображатьЗаголовок" Тогда
				ИскомыйЭлемент[Свойство] = Значение = "Да";
				
			ИначеЕсли Свойство = "ОтображениеГруппыКнопок" Тогда
				ИскомыйЭлемент.Отображение = ОтображениеГруппыКнопок[Значение];
				
			Иначе
				ИскомыйЭлемент[Свойство] = Значение;

			КонецЕсли;
		//ИначеЕсли ТипЗнч(ИскомыйЭлемент) = Тип("ПолеФормы") Тогда
		//	Если Свойство = "Тип" Тогда
		//		ПереместитьЭлементУправленияНаСервере();
		//		
		//	КонецЕсли;
		Иначе
			ИскомыйЭлемент[Свойство] = Значение;

		КонецЕсли;
	КонецЕсли;

	Возврат Результат;
КонецФункции



&НаКлиенте
Процедура ИзменитьТипЗначения(Свойство, Значение, ЭтоФорма, ИмяЭлемента) Экспорт
	ИзменитьТипЗначенияНаСервере(Свойство, Значение, ЭтоФорма, ИмяЭлемента);
	ЭтаФорма.ОбновитьОтображениеДанных();

КонецПроцедуры

&НаСервере
Функция ИзменитьТипЗначенияНаСервере(Свойство, Значение, ЭтоФорма, ИмяЭлемента)
	Результат = Ложь;
	
	ИскомыйРеквизит = НайтиРеквизитПоИмени(ИмяЭлемента);
	ИскомыйРеквизит.ТипЗначения = Новый ОписаниеТипов(Значение);
	
	ДобавляемыеРеквизиты = Новый Массив(1);
	ДобавляемыеРеквизиты[0] = ИскомыйРеквизит;
	
	УдаляемыеРеквизиты = Новый Массив(1);
	УдаляемыеРеквизиты[0] = ИмяЭлемента;
	
	ИзменитьРеквизиты(ДобавляемыеРеквизиты, УдаляемыеРеквизиты);

	Возврат Результат;
КонецФункции


&НаСервере
Функция НайтиРеквизитПоИмени(ИскомоеИмя)
	Результат = Неопределено;
	
	ВсеРеквизиты = ЭтаФорма.ПолучитьРеквизиты();
	Для Каждого Реквизит Из ВсеРеквизиты Цикл
		Если Реквизит.Имя = ИскомоеИмя Тогда
			Результат = Реквизит;
			
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Результат;	
КонецФункции

&НаСервере
Функция ДобавитьРеквизит(Имя, Тип, Путь = "")
	МассивДобавляемыхРеквизитов = Новый Массив;
	
	НовыйРеквизит = Новый РеквизитФормы(Имя, Новый ОписаниеТипов(Тип), Путь);
	МассивДобавляемыхРеквизитов.Добавить(НовыйРеквизит);
	
	ЭтаФорма.ИзменитьРеквизиты(МассивДобавляемыхРеквизитов);
	
КонецФункции

&НаСервере
Функция ДобавитьКоманду(ИмяКоманды, Действие, Заголовок)
	НоваяКоманда = ЭтаФорма.Команды.Добавить(ИмяКоманды);
	НоваяКоманда.Действие = Действие;
	НоваяКоманда.Заголовок = Заголовок;
	НоваяКоманда.Отображение = ОтображениеКнопки.Текст;
	
КонецФункции

&НаКлиенте
Процедура ОбработатьКоманду(Команда)
	Сообщить(Команда.Имя);
	
КонецПроцедуры

