//--- создадим свою структуру под хранение событий календаря с вещественными значениям вместо целочисленных
struct AdjustedCalendarValue
  {
   ulong                               id;                    // ID значения
   ulong                               event_id;              // ID события
   datetime                            time;                  // время и дата события
   datetime                            period;                // отчетный период события
   int                                 revision;              // ревизия публикуемого индикатора по отношению к отчетному периоду
   double                              actual_value;          // актуальное значение показателя
   double                              prev_value;            // предыдущее значение показателя
   double                              revised_prev_value;    // пересмотренное предыдущее значение показателя
   double                              forecast_value;        // прогнозное значение показателя
   ENUM_CALENDAR_EVENT_IMPACT          impact_type;           // потенциальное влияние на курс валюты
  };
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void nes2()
  {
//---
//--- код страны для Европейского союза по стандарту ISO 3166-1 Alpha-2
   string EU_code="EU";
//--- получим все значения событий по Европейскому союзу
   MqlCalendarValue values[];
//--- зададим границы диапазона, из которого берем события
   datetime date_from=D'01.01.2021';  // берем все события с 2021 года
   datetime date_to=0;                // 0 означает все известные события, даже те, что не наступили еще
//--- запросим историю события по Европейскому союзу с 2021 года
   if(!CalendarValueHistory(values, date_from, date_to, EU_code))
     {
      PrintFormat("Ошибка! Не удалось получить события по стране country_code=%s", EU_code);
      PrintFormat("Код ошибки: %d", GetLastError());
      return;
     }
   else
      PrintFormat("Получены значения событий по country_code=%s: %d",
                  EU_code, ArraySize(values));
//--- уменьшим размер массива для вывода в Журнал
   if(ArraySize(values)>5)
      ArrayResize(values, 5);
//--- выведем значения событий в Журнал как есть, без проверок и приведения к актуальным значениям
   Print("Выводим значения календаря как есть");
   ArrayPrint(values);
 
//--- проверим значения полей и приведем к актуальным значениям
//--- первый вариант проверок и получения значений
   AdjustedCalendarValue values_adjusted_1[];
   int total=ArraySize(values);
   ArrayResize(values_adjusted_1, total);
//--- копируем значения с проверками и корректировками
   for(int i=0; i<total; i++)
     {
      values_adjusted_1[i].id=values[i].id;
      values_adjusted_1[i].event_id=values[i].event_id;
      values_adjusted_1[i].time=values[i].time;
      values_adjusted_1[i].period=values[i].period;
      values_adjusted_1[i].revision=values[i].revision;
      values_adjusted_1[i].impact_type=values[i].impact_type;
      //--- делаем проверки значений и делим на 1 000 000
      if(values[i].actual_value==LONG_MIN)
         values_adjusted_1[i].actual_value=double("nan");
      else
         values_adjusted_1[i].actual_value=values[i].actual_value/1000000.;
 
      if(values[i].prev_value==LONG_MIN)
         values_adjusted_1[i].prev_value=double("nan");
      else
         values_adjusted_1[i].prev_value=values[i].prev_value/1000000.;
 
      if(values[i].revised_prev_value==LONG_MIN)
         values_adjusted_1[i].revised_prev_value=double("nan");
      else
         values_adjusted_1[i].revised_prev_value=values[i].revised_prev_value/1000000.;
 
      if(values[i].forecast_value==LONG_MIN)
         values_adjusted_1[i].forecast_value=double("nan");
      else
         values_adjusted_1[i].forecast_value=values[i].forecast_value/1000000.;
     }
   Print("Первый способ проверки и получения значений календаря");
   ArrayPrint(values_adjusted_1);
 
//--- второй вариант проверок и получения значений
   AdjustedCalendarValue values_adjusted_2[];
   ArrayResize(values_adjusted_2, total);
//--- копируем значения с проверками и корректировками
   for(int i=0; i<total; i++)
     {
      values_adjusted_2[i].id=values[i].id;
      values_adjusted_2[i].event_id=values[i].event_id;
      values_adjusted_2[i].time=values[i].time;
      values_adjusted_2[i].period=values[i].period;
      values_adjusted_2[i].revision=values[i].revision;
      values_adjusted_2[i].impact_type=values[i].impact_type;
      //--- делаем проверки и получаем значения
      if(values[i].HasActualValue())
         values_adjusted_2[i].actual_value=values[i].GetActualValue();
      else
         values_adjusted_2[i].actual_value=double("nan");
 
      if(values[i].HasPreviousValue())
         values_adjusted_2[i].prev_value=values[i].GetPreviousValue();
      else
         values_adjusted_2[i].prev_value=double("nan");
 
      if(values[i].HasRevisedValue())
         values_adjusted_2[i].revised_prev_value=values[i].GetRevisedValue();
      else
         values_adjusted_2[i].revised_prev_value=double("nan");
 
      if(values[i].HasForecastValue())
         values_adjusted_2[i].forecast_value=values[i].GetForecastValue();
      else
         values_adjusted_2[i].forecast_value=double("nan");
     }
   Print("Второй способ проверки и получения значений календаря");
   ArrayPrint(values_adjusted_2);
 
//--- третий вариант получения значений - без проверок
   AdjustedCalendarValue values_adjusted_3[];
   ArrayResize(values_adjusted_3, total);
//--- копируем значения с проверками и корректировками
   for(int i=0; i<total; i++)
     {
      values_adjusted_3[i].id=values[i].id;
      values_adjusted_3[i].event_id=values[i].event_id;
      values_adjusted_3[i].time=values[i].time;
      values_adjusted_3[i].period=values[i].period;
      values_adjusted_3[i].revision=values[i].revision;
      values_adjusted_3[i].impact_type=values[i].impact_type;
      //--- получаем значения без проверок
      values_adjusted_3[i].actual_value=values[i].GetActualValue();
      values_adjusted_3[i].prev_value=values[i].GetPreviousValue();
      values_adjusted_3[i].revised_prev_value=values[i].GetRevisedValue();
      values_adjusted_3[i].forecast_value=values[i].GetForecastValue();
     }
   Print("Третий способ получения значений календаря - без проверок");
   ArrayPrint(values_adjusted_3);
  }