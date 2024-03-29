//--- создадим свою структуру под хранение событий календаря с вещественными значениям вместо целочисленных
struct AdjustedCalendarValue
  {
   ulong                               id;                    // ID значения
   ulong                               event_id;              // ID события
   datetime                            time;                  // время и дата события
   datetime                            period;                // отчетный период события
  };
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
bool news_Bool = false;
int news = 0;
bool News()
  {
//--- получим все значения событий экономического календаря
   MqlCalendarValue values[];
//--- зададим границы диапазона, из которого берем события
   datetime date_from=TimeCurrent();  // берем все события с текущего тика
   datetime date_to=date_from+60;     // миллисекунд. 0 означает все известные события, даже те, что не наступили еще
   if(CalendarValueHistory(values,date_from,date_to))
     {
//--- уменьшим размер массива для вывода в Журнал
      if(ArraySize(values)>0)
      {ArrayResize(values,30);
      //ArrayPrint(values);
      }    
     }
     AdjustedCalendarValue values_adjusted_3[];
     int total=ArraySize(values);
     ArrayResize(values_adjusted_3, total);
//--- копируем значения с проверками и корректировками
   for(int i=0; i<total; i++)
     {
      values_adjusted_3[i].id=values[i].id;
      values_adjusted_3[i].event_id=values[i].event_id;
      values_adjusted_3[i].time=values[i].time;
      values_adjusted_3[i].period=values[i].period;
      string time      = TimeToString(values_adjusted_3[i].time);
      string period    = TimeToString(values_adjusted_3[i].period);
      string TimeNewsM = time.Substr(14,2);  // минуты
      string TimeNewsH = time.Substr(11,5);  // 20:14 час и минуты с :
      string TimeNewsY = time.Substr(0,4);   // год
      string TimeNewsP = period.Substr(0,4); // год период
      //Print("Будет время через минуту - ",RealTimeNews);
      //Print("Время ближайшей новости - ",TimeNewsH);
      //Print("Цикл" , i);
      if((TimeNewsY == "2022")  && 
         (TimeNewsM != "00:00") && 
         (TimeNewsP == "2022")  &&
         (RealTimeNews == TimeNewsM))
         {news = 1;}
     }
     if(news>0)
     {caseOrder = 0;
      news_Bool = true;
      news = 0;}
     else
      {news_Bool = false;}
     
return(news_Bool);}