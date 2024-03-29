bool OpenOrder(){

switch(caseOrder)
{
   case 0:
   {// Ордер на покупку
   MqlTradeRequest requestBay0={};                                    // создаем массив 
   MqlTradeResult resultBay0={0};                                     // создаем и обнуляем массив 2
   requestBay0.action = TRADE_ACTION_PENDING;                         // указываем тип открытия ордера по условиям
   requestBay0.symbol = Symbol();                                  // указываем валюту ордера
   requestBay0.volume = lot;                                          // указываем объем ордера
   requestBay0.deviation = 2;                                         // указываем проскальзывание
   requestBay0.type = ORDER_TYPE_BUY_STOP;                            // указываем тип ордера
   requestBay0.price = NormalizeDouble(ask+OpenPrice*Point(),5);          // указываем цену открытия
   requestBay0.sl = NormalizeDouble(bid-StopLoss*Point(),5);             // указываем стоп лосс
   requestBay0.comment = "Buy";
   if(!OrderSend(requestBay0,resultBay0))                                 // если одер не открылся
      PrintFormat("Error open order Buy %d", GetLastError());   // обрабатываем ошибку
   else                                                           // если ордер открылся
      {
      Print("Ticket order Buy - ",resultBay0.order);
      }           // выводится сообщение с тикетом ордера
   
// Ордер на продажу 1
   MqlTradeRequest requestSell0={};                                    // создаем массив 
   MqlTradeResult resultSell0={0};                                     // создаем и обнуляем массив 2
   requestSell0.action = TRADE_ACTION_PENDING;                         // указываем тип открытия ордера по условиям
   requestSell0.symbol = Symbol();                                  // указываем валюту ордера
   requestSell0.volume = lot;                                          // указываем объем ордера
   requestSell0.deviation = 2;                                         // указываем проскальзывание
   requestSell0.type = ORDER_TYPE_SELL_STOP;                            // указываем тип ордера
   requestSell0.price = NormalizeDouble(bid-OpenPrice*Point(),5);          // указываем цену открытия
   requestSell0.sl = NormalizeDouble(ask+StopLoss*Point(),5);             // указываем стоп лосс
   requestSell0.comment = "Sell";
   if(!OrderSend(requestSell0,resultSell0))                                 // если одер не открылся
      PrintFormat("Error open order Sell %d", GetLastError());   // обрабатываем ошибку
   else                                                           // если ордер открылся
      {Print("Ticket order Sell - ",resultSell0.order);}
   }             // выводится сообщение с тикетом ордера
//-------------------------------------------------------------------------------------------------------------------------

}//swith

return(true);
};