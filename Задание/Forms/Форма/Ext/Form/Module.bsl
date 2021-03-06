
&НаСервере
Процедура КомандаНаСервере()
	Чтение = Новый ЧтениеJSON();
	Чтение.ОткрытьФайл("c:\temp\Task.json");
	
	ПроверяемыеПоля = Новый Массив();
	ПроверяемыеПоля.Добавить("kkm_uuid");
	ПроверяемыеПоля.Добавить("staff_uuid");
	ПроверяемыеПоля.Добавить("customer_uuid");
	ПроверяемыеПоля.Добавить("receipt");
	ПроверяемыеПоля.Добавить("operation");
	ПроверяемыеПоля.Добавить("bonus");
	ПроверяемыеПоля.Добавить("products");
	ПроверяемыеПоля.Добавить("id");
	ПроверяемыеПоля.Добавить("barcode");
	
	Данные = ПрочитатьJSON(Чтение,,,,"ФункцияПроверкиЗначений",ЭтотОбъект,,ПроверяемыеПоля,5);

	Чтение.Закрыть();
КонецПроцедуры


&НаСервере
Функция ФункцияПроверкиЗначений(Свойство, Значение, ДополнительныеПараметры)Экспорт
	
	Если (Свойство = "kkm_uuid" ИЛИ Свойство = "staff_uuid" ИЛИ Свойство = "customer_uuid") И Значение = "" Тогда
		Сообщить("Поле не заполнено: " + Свойство);
	КонецЕсли;
	
	Если Свойство = "receipt" И ТипЗнч(Значение) = Тип("Структура") И Значение.Количество() = 0 Тогда
		Сообщить("Не заполнен объект: " + Свойство);		
	КонецЕсли;
	
	Если (Свойство = "operation" ИЛИ Свойство = "bonus") И Значение = "" Тогда
		Сообщить("Для объекта ""receipt"" не заполнено поле : " + Свойство);		
	КонецЕсли;
	
	Если Свойство = "products" И ТипЗнч(Значение)= Тип("Массив") И Значение.Количество() = 0 Тогда
		Сообщить("Для объекта ""receipt"" не заполнено поле : " + Свойство);
	КонецЕсли;
	
	Если Свойство = "barcode" И Значение = "" Тогда
		Сообщить("Для объекта ""receipt"" --> свойства ""products"" не заполнено поле : " + Свойство);
	КонецЕсли;
	
	Если Свойство = "id" И Значение = NULL Тогда
		Сообщить("Для объекта ""receipt"" --> свойства ""products"" не заполнено поле : " + Свойство);
	КонецЕсли;
	
КонецФункции


&НаКлиенте
Процедура Команда(Команда)
	КомандаНаСервере();
КонецПроцедуры