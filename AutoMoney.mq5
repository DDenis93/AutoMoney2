//+------------------------------------------------------------------+
//|                                                    AutoMoney.mq5 |
//|                                                            Denis |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Denis"
#property link      ""
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
// Файлы проверки ошибок с MQL5
///#include <CheckMoneyForTrade.mqh> // Нехватка средств для проведения торговой операции
//#include <CheckVolumeValue.mqh>   // Неправильные объемы в торговых операциях
//#include <IsNewOrderAllowed.mqh>  // Ограничение на количество отложенных ордеров
// Ограничение на количество лотов по одному символу - внедрить
// Установка уровней TakeProfit и StopLoss в пределах минимального уровня SYMBOL_TRADE_STOPS_LEVEL - внедрить
// Попытка модификации ордера или позиции в пределах уровня заморозки SYMBOL_TRADE_FREEZE_LEVEL - внедрить
// Ошибки, возникающие при работе с символами с недостаточной историей котировок
// Выход за пределы мссива (array out of range)
// Отправка запроса на модификацию уровней без фактического их изменения
// Попытка импорта скомпилированных файлов (даже EX$/EX5) и DLL
// Обращение к пользовательским индикаторам через iCustom()
// Передача недопустимого параметра в функцию (ошибки времени выполнения)
// Access violation
// Потребление ресурсов процессора памяти

// Мои файлы
#include <Connect.mqh>
#include <Errors.mqh>
#include <ErrorsServer.mqh>
#include <OrdersModifyActive.mqh>
#include <OrdersModifyPerspective.mqh>
#include <TimeServer.mqh>
#include <Balance.mqh>
#include <OpenOrder.mqh>
#include <News.mqh>
#include <Signal.mqh>

input int OpenPrice = 50; // Цена открытия
input int StopLoss  = 50; // Стоп лосс
input int TrallStop = 50; // Трейлинг стоп

//переменные времени
int TimePeriod = 0;
string RealTimeServer;
string RealTimeYear;
string RealTimeMonth;
string RealTimeHor;
string RealTimeMinut;
string RealTimeNews;

int caseOrder; // кейс для открытия ордеров по каждому часу в отдельности
double balance;
double RealFreeBalance;
bool count = true;
double balances;                // общий баланс счета
double balanceFreeMargin;       // свободная маржа
int CreditPlecho;               // кредитное плече счета
double bid = 0.0;
double ask = 0.0;
bool b;

double lot;
int ab = 0;
int OnInit()
  {return(INIT_SUCCEEDED);}
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
//-----------------------------------------------
   MqlTick price;
   if(SymbolInfoTick(Symbol(),price)==true)
   {bid = price.bid;
    ask = price.ask;}
   else
   {Print("Нет Цен");}
//-----------------------------------------------
OrdersModifyActive();
//-----------------------------------------------
       // блок инициализации времени сервера
   RealTimeServer = TimeToString(TimeCurrent());
   RealTimeYear   = RealTimeServer.Substr(0,4);
   RealTimeMonth  = RealTimeServer.Substr(5,2);
   RealTimeHor    = RealTimeServer.Substr(11,2);
   RealTimeMinut  = RealTimeServer.Substr(14,2);
   RealTimeNews  = TimeToString(TimeCurrent()+60).Substr(14,2);
//-----------------------------------------------
if((RealTimeMinut == "01") || // удаление ордеров
   (RealTimeMinut == "11") ||
   (RealTimeMinut == "16") ||
   (RealTimeMinut == "21") ||
   (RealTimeMinut == "26") ||
   (RealTimeMinut == "31") ||
   (RealTimeMinut == "41") ||
   (RealTimeMinut == "46") ||
   (RealTimeMinut == "51") ||
   (RealTimeMinut == "56"))
   {OrdersModifyPerspective();}
//----------------------------------------------- Открытие торговой сессии США
if((RealTimeHor == "15") && (RealTimeMinut == "59"))
   {
      if(Balance() == true)
      {
            MqlTradeRequest request2 = {};
            MqlTradeResult result2 = {};
            int total2=OrdersTotal();
            if(total2 < 2)
            {OpenOrder();
             Sleep(3000);}
      }
   }
//-----------------------------------------------
if(News() == true)
   {
      if(Balance() == true)
         {
            MqlTradeRequest request2 = {};
            MqlTradeResult result2 = {};
            int total2=OrdersTotal();
            if(total2 < 2)
            {OpenOrder();
             Sleep(3000);}
         }
   }
}
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTrade()
  {
//---
  }
//+------------------------------------------------------------------+
//| TradeTransaction function                                        |
//+------------------------------------------------------------------+
void OnTradeTransaction(const MqlTradeTransaction& trans,
                        const MqlTradeRequest& request,
                        const MqlTradeResult& result)
  {
//---
  }
//+------------------------------------------------------------------+