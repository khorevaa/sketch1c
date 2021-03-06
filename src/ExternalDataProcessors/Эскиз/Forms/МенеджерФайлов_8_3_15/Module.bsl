
&НаКлиенте
Процедура СохранитьФайл(РасположениеФайла, АдресФайлаВХранилище, Интерактивно, ОписаниеОповещения = Неопределено) Экспорт
	
	Если ОписаниеОповещения = Неопределено Тогда
		ОписаниеОповещения = Новый ОписаниеОповещения("СохранитьФайлЗавершение", ЭтотОбъект);
	КонецЕсли;

	НачатьПолучениеФайлаССервера(ОписаниеОповещения, АдресФайлаВХранилище, РасположениеФайла);
	
КонецПроцедуры

//@skip-warning
&НаКлиенте
Процедура СохранитьФайлЗавершение(ПолученныеФайлы, ДополнительныеПараметры) Экспорт
	// Заглушка	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьФайл(РасположениеФайла, Интерактивно, ВыполняемоеОповещение) Экспорт
	
	ДополнительныеПараметры = Новый Структура;
	ДополнительныеПараметры.Вставить("ВыполняемоеОповещение", ВыполняемоеОповещение);
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ЗагрузитьФайлЗавершение", ЭтотОбъект, ДополнительныеПараметры);	
	НачатьПомещениеФайлаНаСервер(ОписаниеОповещения,,,, РасположениеФайла);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьФайлЗавершение(ОписаниеПомещенногоФайла, ДополнительныеПараметры) Экспорт
	
	Если ОписаниеПомещенногоФайла = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ВыполнитьОбработкуОповещения(ДополнительныеПараметры.ВыполняемоеОповещение, ОписаниеПомещенногоФайла.Адрес);
	
КонецПроцедуры
