int Connect()
{
   //NewBar();
   //Print("Брокер: ",AccountInfoString(ACCOUNT_COMPANY));
   //Print("Пользователь: ",AccountInfoString(ACCOUNT_NAME));
   //Print("Номер счета: ",AccountInfoInteger(ACCOUNT_LOGIN));
   CreditPlecho = ACCOUNT_LEVERAGE;
   //Print("Кредитное плечо: ",CreditPlecho);
   //Print("Максимальное количество отложенных ордеров ",ACCOUNT_LIMIT_ORDERS);
   balance = AccountInfoDouble(ACCOUNT_BALANCE);
   //Print("Текущая прибыль: ",AccountInfoDouble(ACCOUNT_PROFIT), " руб.");
   //Print("Собственные средства: ",AccountInfoDouble(ACCOUNT_EQUITY)," руб.");
   //Print("Размер залога по сделкам: ",AccountInfoDouble(ACCOUNT_MARGIN)," руб.");
   balanceFreeMargin = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
   //Print("Средства доступные для открытия сделок: ",balanceFreeMargin," руб.");
   
   //SendNotification("Эксперт инициализирован"); // PUSH уведомление на телефон
   
return(0);
};