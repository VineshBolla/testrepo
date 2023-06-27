public with sharing class AccountDemoController {
    public AccountDemoController() {

    }
    @AuraEnabled(cacheable=true)
    public static list<Account> displayAccRecords(){
        List<Account> acclist=[select Id,Name from Account LIMIT 10];
        return acclist;
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> displayConRecords(string accId){
        List<Contact> conlist=new list<Contact>();
        for(Contact con:[select Id,LastName,AccountId from contact where AccountId=:accId]){
            conlist.add(con);
        }
        return conlist;
    }
}