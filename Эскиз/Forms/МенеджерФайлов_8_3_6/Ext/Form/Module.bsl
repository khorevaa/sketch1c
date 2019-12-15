﻿
&НаКлиенте
Функция СохранитьФайл(РасположениеФайла, АдресФайлаВХранилище, Интерактивно, ОписаниеОповещения = Неопределено) Экспорт
	Если ОписаниеОповещения = Неопределено Тогда
		ОписаниеОповещения = Новый ОписаниеОповещения("СохранитьФайлЗавершение", ЭтотОбъект);
		
	КонецЕсли;
	
	ПолучаемыеФайлы = Новый Массив;
	НовыйФайл = Новый ОписаниеПередаваемогоФайла(РасположениеФайла, АдресФайлаВХранилище);
	ПолучаемыеФайлы.Добавить(НовыйФайл);
	
	НачатьПолучениеФайлов(ОписаниеОповещения, ПолучаемыеФайлы,, Интерактивно);
	
КонецФункции

&НаКлиенте
Процедура СохранитьФайлЗавершение(ПолученныеФайлы, ДополнительныеПараметры) Экспорт
	// Заглушка	
КонецПроцедуры

&НаКлиенте
Функция ЗагрузитьФайл(РасположениеФайла, Интерактивно, ВыполняемоеОповещение) Экспорт
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("ВыполняемоеОповещение", ВыполняемоеОповещение);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ЗагрузитьФайлЗавершение", ЭтотОбъект, ДополнительныеПараметры);	
	НачатьПомещениеФайла(ОписаниеОповещения,, РасположениеФайла, Интерактивно);
	
КонецФункции

&НаКлиенте
Процедура ЗагрузитьФайлЗавершение(Результат, Адрес, ВыбранноеИмяФайла, ДополнительныеПараметры) Экспорт
	Если Результат Тогда
		ВыполнитьОбработкуОповещения(ДополнительныеПараметры.ВыполняемоеОповещение, Адрес);

	КонецЕсли;
КонецПроцедуры
