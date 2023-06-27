public with sharing class AccountController {
    public string accountId{get;set;}
    public Account actobj{get;set;}
    public AccountController(){
        actobj = new Account();
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT id,name,type,phone,industry FROM Account LIMIT 10];
    }
    @AuraEnabled
    public static List<Account> getAccountRecordsList(){
        return [SELECT id,name,type,phone,industry FROM Account LIMIT 10];
    }
    public pageReference retrieveAccountDetail(){
        if(accountId!=null){
            actobj=[SELECT id,name,type,industry FROM Account Where id=:accountId];
        }
        return null;
    }
}