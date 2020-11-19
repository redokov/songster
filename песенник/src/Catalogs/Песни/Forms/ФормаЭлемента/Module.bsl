

&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
		
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
		Если Не ЗначениеЗаполнено(Объект.Наименование) тогда
		стрДляОбработки = СокрЛП (Объект.ТекстПесни)+Символы.ПС;
		стрНаименование = "";
		ТекущаяДлинаСтроки = СтрДлина(стрДляОбработки);
		Пока стрНаименование = "" и ТекущаяДлинаСтроки > 0 цикл
			ПозицияПереводаСтроки = Найти (стрДляОбработки, Символы.ПС);
			стрНаименование = СокрЛП (Лев(стрДляОбработки, ПозицияПереводаСтроки-1));
			ТекущаяДлинаСтроки = СтрДлина(стрДляОбработки);
			стрДляОбработки = Прав (стрДляОбработки, ТекущаяДлинаСтроки - ПозицияПереводаСтроки);
		КонецЦикла;
		
		Объект.Наименование = стрНаименование;
		Отказ = стрНаименование = ""; //нет смысла записывать, если наименование не определено
		Сообщить ("Текст песни не должен быть пустым!", СтатусСообщения.ОченьВажное);
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура ВключитьДоступность(Команда)
	
	Элементы.ТекстПесни.ТолькоПросмотр = Ложь;;

КонецПроцедуры

&НаКлиенте
Процедура ЭтоДневник(Команда)
	Объект.Наименование = "Дневник "+Формат(ТекущаяДата(),"ДФ=yyyy.MM.dd;");
	Объект.ТекстПесни = Объект.Наименование + Символы.ПС + Объект.ТекстПесни;
КонецПроцедуры

&НаКлиенте
Процедура УказатьСостояние(Команда)
	ПараметрыОткрытия = Новый Структура ("Ключ", "Новый");
	ОткрытьФорму ("РегистрСведений.ЗначенияПоказателейМониторинга.Форма.ФормаНабораЗаписей", 
		ПараметрыОткрытия, 
		ЭтотОбъект, 
		ЭтотОбъект.КлючУникальности);
КонецПроцедуры



