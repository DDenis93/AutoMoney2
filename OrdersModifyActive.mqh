void OrdersModifyActive()
{
   
   MqlTradeRequest request1;
   MqlTradeResult result1;
   int total1=PositionsTotal();
   //Print("Всего действующих ордеров - ",total1);
   for(int i=0;i<total1;i++)
   {
      ulong position_ticket = PositionGetTicket(i); // тикет позиции
      double sl=PositionGetDouble(POSITION_SL);  // Stop Loss позиции текущий
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);  // тип позиции
      string coment = PositionGetString(POSITION_COMMENT);
      
      double price1 = PositionGetDouble(POSITION_PRICE_OPEN);        // цена открытия ордера
      
      double stl0 = bid-TrallStop*Point(); // цена нового стоп лосса
      double stl1 = ask+TrallStop*Point(); // цена нового стоп лосса
 
      
      if((coment == "Buy") && // тип ордера SELL или BAY
         (bid > (price1+30*Point())) && // текущая больше цены открытия ордера
         (stl0 != sl) && // новый стоп лосс не равен старому стоп лоссу
         (stl0 > sl)) // новый стоп лосс больше старого стоп лосса
      {
         {
         ZeroMemory(request1); // обнуление структуры по всей видимости
         ZeroMemory(result1);
         request1.action = TRADE_ACTION_SLTP; // выбор типа торговой операции
         request1.position = position_ticket; // тикет текущей позиции в цикле
         request1.sl = stl0; // текущая цена -422 пунктов - новый стоп лосс
         if(!OrderSend(request1,result1))                                 // если одер не открылся
         PrintFormat("Error modify order BAY %d", GetLastError());   // обрабатываем ошибку
         }
      }
 
      if((coment == "Sell") &&
         (ask < (price1-30*Point())) && // текущая меньше цены открытия ордера
         (stl1 != sl) && // новый стоп лосс не равен старому стоп лоссу
         (stl1 < sl)) // новый стоп лосс меньше старого стоп лосса
      {
         {
         ZeroMemory(request1); // обнуление структуры по всей видимости
         ZeroMemory(result1);
         request1.action = TRADE_ACTION_SLTP; // выбор типа торговой операции
         request1.position = position_ticket; // тикет текущей позиции в цикле
         request1.sl = stl1; // текущая цена +422 пунктов - новый стоп лосс
         if(!OrderSend(request1,result1))                                 // если одер не открылся
         PrintFormat("Error modify order SELL %d", GetLastError());   // обрабатываем ошибку
         }
      }  
   }
};