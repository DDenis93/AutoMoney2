int TestErrorServer = 1;
void ErrorsServer()
{
switch(TestErrorServer)
{
case 10004: Print("ОШИБКА: TRADE_RETCODE_REQUOTE - Реквота"); break;
case 10006: Print("ОШИБКА: TRADE_RETCODE_REJECT - Запрос отклонен"); break;
case 10007: Print("ОШИБКА: TRADE_RETCODE_CANCEL - Запрос отменен трейдером"); break;
case 10008: Print("ОШИБКА: TRADE_RETCODE_PLACED - Ордер размещен"); break;
case 10009: Print("ОШИБКА: TRADE_RETCODE_DONE - Заявка выполнена"); break;
case 10010: Print("ОШИБКА: TRADE_RETCODE_DONE_PARTIAL - Заявка выполнена частично"); break;
case 10011: Print("ОШИБКА: TRADE_RETCODE_ERROR - Ошибка обработки запроса"); break;
case 10012: Print("ОШИБКА: TRADE_RETCODE_TIMEOUT - Запрос отменен по истечению времени"); break;
case 10013: Print("ОШИБКА: TRADE_RETCODE_INVALID - Неправильный запрос"); break;
case 10014: Print("ОШИБКА: TRADE_RETCODE_INVALID_VOLUME - Неправильный объем в запросе"); break;
case 10015: Print("ОШИБКА: TRADE_RETCODE_INVALID_PRICE - Неправильная цена в запросе"); break;
case 10016: Print("ОШИБКА: TRADE_RETCODE_INVALID_STOPS - Неправильные стопы в запросе"); break;
case 10017: Print("ОШИБКА: TRADE_RETCODE_TRADE_DISABLED - Торговля запрещена"); break;
case 10018: Print("ОШИБКА: TRADE_RETCODE_MARKET_CLOSED - Рынок закрыт"); break;
case 10019: Print("ОШИБКА: TRADE_RETCODE_NO_MONEY - Нет достаточных денежных средств для выполнения запроса"); break;
case 10020: Print("ОШИБКА: TRADE_RETCODE_PRICE_CHANGED - Цены изменились"); break;
case 10021: Print("ОШИБКА: TRADE_RETCODE_PRICE_OFF - Отсутствуют котировки для обработки запроса"); break;
case 10022: Print("ОШИБКА: TRADE_RETCODE_INVALID_EXPIRATION - Неверная дата истечения ордера в запросе"); break;
case 10023: Print("ОШИБКА: TRADE_RETCODE_ORDER_CHANGED - Состояние ордера изменилось"); break;
case 10024: Print("ОШИБКА: TRADE_RETCODE_TOO_MANY_REQUESTS - Слишком частые запросы"); break;
case 10025: Print("ОШИБКА: TRADE_RETCODE_NO_CHANGES - В запросе нет изменений"); break;
case 10026: Print("ОШИБКА: TRADE_RETCODE_SERVER_DISABLES_AT - Автотрейдинг запрещен сервером"); break;
case 10027: Print("ОШИБКА: TRADE_RETCODE_CLIENT_DISABLES_AT - Автотрейдинг запрещен клиентским терминалом"); break;
case 10028: Print("ОШИБКА: TRADE_RETCODE_LOCKED - Запрос заблокирован для обработки"); break;
case 10029: Print("ОШИБКА: TRADE_RETCODE_FROZEN - Ордер или позиция заморожены"); break;
case 10030: Print("ОШИБКА: TRADE_RETCODE_INVALID_FILL - Указан неподдерживаемый тип исполнения ордера по остатку"); break;
case 10031: Print("ОШИБКА: TRADE_RETCODE_CONNECTION - Нет соединения с торговым сервером"); break;
case 10032: Print("ОШИБКА: TRADE_RETCODE_ONLY_REAL - Операция разрешена только для реальных счетов"); break;
case 10033: Print("ОШИБКА: TRADE_RETCODE_LIMIT_ORDERS - Достигнут лимит на количество отложенных ордеров"); break;
case 10034: Print("ОШИБКА: TRADE_RETCODE_LIMIT_VOLUME - Достигнут лимит на объем ордеров и позиций для данного символа"); break;
case 10035: Print("ОШИБКА: TRADE_RETCODE_INVALID_ORDER - Неверный или запрещённый тип ордера"); break;
case 10036: Print("ОШИБКА: TRADE_RETCODE_POSITION_CLOSED - Позиция с указанным POSITION_IDENTIFIER уже закрыта"); break;
case 10038: Print("ОШИБКА: TRADE_RETCODE_INVALID_CLOSE_VOLUME - Закрываемый объем превышает текущий объем позиции"); break;
case 10039: Print("ОШИБКА: TRADE_RETCODE_CLOSE_ORDER_EXIST - Для указанной позиции уже есть ордер на закрытие. Может возникнуть при работе в системе хеджинга: 1) при попытке закрытия позиции встречной, если уже есть ордера на закрытие этой позиции; 2) при попытке полного или частичного закрытия, если суммарный объем уже имеющихся ордеров на закрытие и вновь выставляемого ордера превышает текущий объем позиции"); break;
case 10040: Print("ОШИБКА: TRADE_RETCODE_LIMIT_POSITIONS - Количество открытых позиций, которое можно одновременно иметь на счете, может быть ограничено настройками сервера. При достижении лимита в ответ на выставление ордера сервер вернет ошибку TRADE_RETCODE_LIMIT_POSITIONS. Ограничение работает по-разному в зависимости от типа учета позиций на счете: · Неттинговая система — учитывается количество открытых позиции. При достижении лимита платформа не позволит выставлять новые ордера, в результате исполнения которых может увеличиться количество открытых позиций. Фактически, платформа позволит выставлять ордера только по тем символам, по которым уже есть открытые позиции. В неттинговой системе при проверке лимита не учитываются текущие отложенные ордера, поскольку их исполнение может привести к изменению текущих позиций, а не увеличению их количества. Хеджинговая система — помимо открытых позиций, учитываются выставленные отложенные ордера, поскольку их срабатывание всегда приводит к открытию новой позиции. При достижении лимита платформа не позволит выставлять рыночные ордера на открытие позиций, а также отложенные ордера."); break;
case 10041: Print("ОШИБКА: TRADE_RETCODE_REJECT_CANCEL - Запрос на активацию отложенного ордера отклонен, а сам ордер отменен"); break;
case 10042: Print("ОШИБКА: TRADE_RETCODE_LONG_ONLY - Запрос отклонен, так как на символе установлено правило 'Разрешены только длинные позиции' (POSITION_TYPE_BUY)"); break;
case 10043: Print("ОШИБКА: TRADE_RETCODE_SHORT_ONLY - Запрос отклонен, так как на символе установлено правило 'Разрешены только короткие позиции' (POSITION_TYPE_SELL)"); break;
case 10044: Print("ОШИБКА: TRADE_RETCODE_CLOSE_ONLY - Запрос отклонен, так как насимволе установлено правило 'Разрешено только закрывать существующие позиции'"); break;
case 10045: Print("ОШИБКА: TRADE_RETCODE_FIFO_CLOSE - Запрос отклонен, так как для торгового счета установлено правило 'Разрешено закрывать существующие позиции только по правилу FIFO' (ACCOUNT_FIFO_CLOSE=true)"); break;
case 10046: Print("ОШИБКА: TRADE_RETCODE_HEDGE_PROHIBITED - Запрос отклонен, так как для торгового счета установлено правило 'Запрещено открывать встречные позиции по одному символу'. Например, если на счете имеется позиция Buy, то пользователь не может открыть позицию Sell или выставить отложенный ордер на продажу. Правило может применяться только на счетах с хеджинговой системой учета (ACCOUNT_MARGIN_MODE=ACCOUNT_MARGIN_"); break;

default: Print("ОШИБОК СЕРВЕРА НЕТ");
};
};