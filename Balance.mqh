bool Balance()
{
   bool a = false; // 
   RealFreeBalance = AccountInfoDouble(ACCOUNT_EQUITY); // текущие свободные средства


   //Print("Свободные средства: ",RealFreeBalance);
   //Print("Средств на счёте: ",AccountInfoDouble(ACCOUNT_EQUITY)," RUB."); // средства на счете в валюте депозита
   //Print("Текущая приыль: ",AccountInfoDouble(ACCOUNT_PROFIT), " RUB."); // текущая прибыль

   double RealPriceRUBUSD = iHigh(Symbol(),PERIOD_M1,0); // текущая цена рубль//доллар
   double RealZalogRub = NormalizeDouble(RealPriceRUBUSD*1000/AccountInfoInteger(ACCOUNT_LEVERAGE),2); // AccountInfoInteger(ACCOUNT_LEVERAGE)
   
   // текущий залог в рублях, нормализованный
   //Print("Маржа = ",RealZalogRub);
   
   if(RealFreeBalance > RealZalogRub) // если свободный баланс больше суммы залога, то
   {
      //Print("Balance ok, open order");
      a = true;
      lot = 0.50;//NormalizeDouble((RealFreeBalance/RealZalogRub)/100-0.01,2);
      // фиксированный лот в данный момент
      //Print("Max lot = ",lot);
   }
   
   
return(a);
};