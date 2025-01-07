
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	// ++Орлов Задача  07.01.2025 
	ДобавитьКнопкуПересчитатьСУчетомСкидки();
	// --Орлов Задача  07.01.2025
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

&НаСервере
Процедура ДобавитьКнопкуПересчитатьСУчетомСкидки() 
	// ++Орлов Задача Добавить программно кнопку и команду на форму 07.01.2025 
	Если Элементы.Найти("КнопкаПересчитатьСУчетомСкидки") = Неопределено Тогда 
		
		//Добавим команду в коллекцию команд
		КомандаПересчитатьСУчетомСкидки = Команды.Добавить("ПересчитатьСУчетомСкидки");
		КомандаПересчитатьСУчетомСкидки.Заголовок = "Пересчитать со скидкой";
		КомандаПересчитатьСУчетомСкидки.Действие = "ПересчитатьСУчетомСкидки";
		
		КнопкаКоманды = Элементы.Добавить("КнопкаПересчитатьСУчетомСкидки", Тип("КнопкаФормы"), Элементы.ГруппаШапкаЛево);
		КнопкаКоманды.ИмяКоманды = "ПересчитатьСУчетомСкидки";
		КнопкаКоманды.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
		
	КонецЕсли;
	// --Орлов Задача Добавить программно кнопку и команду на форму 07.01.2025
КонецПроцедуры

&НаСервере
Процедура ПересчитатьСУчетомСкидкиНаСервере()

КонецПроцедуры 
 
&НаКлиенте
Процедура Дор_РассчитатьСуммуСтроки(ТекущиеДанные)
	// ++Орлов Задача Добавить программно кнопку и команду на форму 07.01.2025
	ТекущиеДанные.Сумма = (ТекущиеДанные.Цена * ТекущиеДанные.Количество) - (ТекущиеДанные.Цена * ТекущиеДанные.Количество) * Объект.Дор_СогласованнаяСкидка / 100;
	
	РассчитатьСуммуДокумента();
	// --Орлов Задача Добавить программно кнопку и команду на форму 07.01.2025
КонецПроцедуры

&НаКлиенте
Процедура ПересчитатьСУчетомСкидки(Команда)
	// ++Орлов Задача Добавить программно кнопку и команду на форму 07.01.2025
	Для Каждого СтрокаТовары Из Объект.Товары Цикл
		Дор_РассчитатьСуммуСтроки(СтрокаТовары);
	КонецЦикла;
	
	Для Каждого СтрокаУслуги Из Объект.Услуги Цикл
		Дор_РассчитатьСуммуСтроки(СтрокаУслуги);
	КонецЦикла;
	// --Орлов Задача Добавить программно кнопку и команду на форму 07.01.2025
КонецПроцедуры


#КонецОбласти

#КонецОбласти
