public class AccountTriggerHandler1 {
    public static void beforeinsertLogic(list<Account> accountlist){
        system.debug(accountlist);
        accountlist[0].phone = '000000';
        system.debug(accountlist);
    }
}