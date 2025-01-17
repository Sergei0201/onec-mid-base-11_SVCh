Процедура ДополнитьФорму(Форма) Экспорт
	
	ИмяФормы = Форма.ИмяФормы; 
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда 
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);	
		ДобавитьПолеСогласованннаяСкидкаПолеГруппаШапкаЛево(Форма)
	ИначеЕсли  ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);	
	ИначеЕсли  ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);	
	ИначеЕсли  ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);	
	ИначеЕсли  ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);	
	КонецЕсли;
	
КонецПроцедуры

#Область СлужебныйКомандныйИнтерфейс 

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.SVCh_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма); 
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), ,Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.SVCh_КонтактноеЛицо";

КонецПроцедуры   

Процедура ДобавитьПолеСогласованннаяСкидкаПолеГруппаШапкаЛево(Форма); 
	
	ГруппаОрганизация = Форма.Элементы.Вставить("ГруппаОгранизация", Тип("ГруппаФормы"),Форма.Элементы.ГруппаШапкаЛево, Форма.Элементы.Организация);
	ГруппаОрганизация.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаОрганизация.ОтображатьЗаголовок = Ложь;
	

	ГруппаСкидки = Форма.Элементы.Вставить("ГруппаСкидок", Тип("ГруппаФормы"),Форма.Элементы.ГруппаШапкаЛево, Форма.Элементы.Организация);
	ГруппаСкидки.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаСкидки.ОтображатьЗаголовок = Ложь;

	
	
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСкидок);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.SVCh_СогласованнаяСкидка"; 
	ПолеВвода.УстановитьДействие("ПриИзменении", "SVCh_СогласованнаяСкидкаПриИзменении")
		
КонецПроцедуры

#КонецОбласти
