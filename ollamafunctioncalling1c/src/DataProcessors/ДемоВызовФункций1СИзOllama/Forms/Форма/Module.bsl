
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Вопрос = "Сколько времени?";
	
	Если Не ЗначениеЗаполнено(АдресРесурса) Тогда
		АдресРесурса = "api/chat/completions";
	КонецЕсли;
	Если Не ЗначениеЗаполнено(Пользователь) Тогда
		Пользователь = "User";
	КонецЕсли;
	Если Не ЗначениеЗаполнено(LLMМодель) Тогда
		LLMМодель = "saiga_llama3_8b_f16:latest";
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ОтправитьВопрос(Команда)
	
	Если ПроверитьЗаполнение() Тогда
		ОтправитьВопросНаСервере();
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ОтправитьВопросНаСервере()
	
	СтруктураПараметров = Новый Структура;
	СтруктураПараметров.Вставить("ИмяСервера", ИмяСервера);
	СтруктураПараметров.Вставить("АдресРесурса", АдресРесурса);
	СтруктураПараметров.Вставить("APIKey", APIKey);
	СтруктураПараметров.Вставить("Пользователь", Пользователь);
	СтруктураПараметров.Вставить("LLMМодель", LLMМодель);
    Ответ = ВызовФункций1СИзOllama.ОтправитьВопрос(Вопрос, СтруктураПараметров);
	Вопрос = "";
	
КонецПроцедуры

#КонецОбласти
