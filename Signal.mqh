bool Signal(){

double bidAUD = 0.0;
double askAUD = 0.0;
double bidEUR = 0.0;
double askEUR = 0.0;
double bidGBP = 0.0;
double askGBP = 0.0;
double bidNZD = 0.0;
double askNZD = 0.0;
double bidJPY = 0.0;
double askJPY = 0.0;
double bidCHF = 0.0;
double askCHF = 0.0;
double bidCAD = 0.0;
double askCAD = 0.0;

bool barTrue = true;

MqlTick price;
   
   if(SymbolInfoTick("AUDUSDrfd",price)==true){
      bidAUD = price.bid;
      askAUD = price.ask;}
   if(SymbolInfoTick("EURUSDrfd",price)==true){
      bidEUR = price.bid;
      askEUR = price.ask;}
   if(SymbolInfoTick("GBPUSDrfd",price)==true){
      bidGBP = price.bid;
      askGBP = price.ask;}
   if(SymbolInfoTick("NZDUSDrfd",price)==true){
      bidNZD = price.bid;
      askNZD = price.ask;} 
   if(SymbolInfoTick("USDJPYrfd",price)==true){
      bidJPY = price.bid;
      askJPY = price.ask;}
   if(SymbolInfoTick("USDCHFrfd",price)==true){
      bidCHF = price.bid;
      askCHF = price.ask;}
   if(SymbolInfoTick("USDCADrfd",price)==true){
      bidCAD = price.bid;
      askCAD = price.ask;} 
      
double bar[7] = {
           iOpen("AUDUSDrfd",PERIOD_D1,0), //0
           iOpen("EURUSDrfd",PERIOD_D1,0), //1
           iOpen("GBPUSDrfd",PERIOD_D1,0), //2
           iOpen("NZDUSDrfd",PERIOD_D1,0), //3
           iOpen("USDJPYrfd",PERIOD_D1,0), //4
           iOpen("USDCHFrfd",PERIOD_D1,0), //5
           iOpen("USDCADrfd",PERIOD_D1,0)};//6
           
  double raznicaAUD = NormalizeDouble(bidAUD - bar[0],5);
  double procentAUD = NormalizeDouble(bar[0]*0.10/100,5);
  double raznicaEUR = NormalizeDouble(bidEUR - bar[1],5);
  double procentEUR = NormalizeDouble(bar[1]*0.10/100,5);
  double raznicaGBP = NormalizeDouble(bidGBP - bar[2],5);
  double procentGBP = NormalizeDouble(bar[2]*0.10/100,5);
  double raznicaNZD = NormalizeDouble(bidNZD - bar[3],5);
  double procentNZD = NormalizeDouble(bar[3]*0.10/100,5);
  double raznicaJPY = NormalizeDouble(bidJPY - bar[4],3);
  double procentJPY = NormalizeDouble(bar[4]*0.10/100,3);
  double raznicaCHF = NormalizeDouble(bidCHF - bar[5],5);
  double procentCHF = NormalizeDouble(bar[5]*0.10/100,5);
  double raznicaCAD = NormalizeDouble(bidCAD - bar[6],5);
  double procentCAD = NormalizeDouble(bar[6]*0.10/100,5);
  
  if(bidAUD > bar[0]){
      raznicaAUD = NormalizeDouble(bidAUD - bar[0],5);
      Print("AUD больше 10%");
  }
  if(bidAUD < bar[0]){
      raznicaAUD = NormalizeDouble(bar[0] - bidAUD,5);    
      Print("AUD меньше 10%");
  }
//---------------------------------------------------------------
  if(bidEUR > bar[1]){
      raznicaEUR = NormalizeDouble(bidEUR - bar[1],5);
      Print("EUR больше 10%");
  }
  if(bidEUR < bar[1]){
      raznicaEUR = NormalizeDouble(bar[1] - bidEUR,5);    
      Print("EUR меньше 10%");
  }
//---------------------------------------------------------------
  if(bidGBP > bar[2]){
      raznicaGBP = NormalizeDouble(bidGBP - bar[2],5);
      Print("GBP больше 10%");
  }
  if(bidGBP < bar[2]){
      raznicaGBP = NormalizeDouble(bar[2] - bidGBP,5);    
      Print("GBP меньше 10%");
  }
//---------------------------------------------------------------
  
  if(bidNZD > bar[3]){
      raznicaNZD = NormalizeDouble(bidNZD - bar[3],5);
      Print("NZD больше 10%");
  }
  if(bidNZD < bar[3]){
      raznicaNZD = NormalizeDouble(bar[3] - bidNZD,5);    
      Print("NZD меньше 10%");
  }
//---------------------------------------------------------------
  if(bidJPY > bar[4]){
      raznicaJPY = NormalizeDouble(bidJPY - bar[4],3);
      Print("JPY больше 10%");
  }
  if(bidJPY < bar[4]){
      raznicaJPY = NormalizeDouble(bar[4] - bidJPY,3);    
      Print("JPY меньше 10%");
  }
//---------------------------------------------------------------
  if(bidCHF > bar[5]){
      raznicaCHF = NormalizeDouble(bidCHF - bar[5],5);
      Print("CHF больше 10%");
  }
  if(bidCHF < bar[5]){
      raznicaCHF = NormalizeDouble(bar[5] - bidCHF,5);    
      Print("CHF меньше 10%");
  }
//---------------------------------------------------------------  
  if(bidCAD > bar[6]){
      raznicaCAD = NormalizeDouble(bidCAD - bar[6],5);
      Print("CAD больше 10%");
  }
  if(bidCAD < bar[6]){
      raznicaCAD = NormalizeDouble(bar[6] - bidCAD,5);    
      Print("CAD меньше 10%");
  }

return(barTrue);}