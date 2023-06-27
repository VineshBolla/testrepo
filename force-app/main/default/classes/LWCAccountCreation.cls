public with sharing class LWCAccountCreation {
    
     @AuraEnabled
    public static list<Account> updateRecord(string accountId, string accountNames, string accountIndustries){
        list<Account> udatedAccountList = new list<Account>();
        if(accountId != Null){
            Account accObj = new Account();
            accObj.Id = accountId;
            accObj.Name = accountNames;
            accObj.Industry = accountIndustries;
            udatedAccountList.add(accObj);       
        }
        
        if(!udatedAccountList.isEmpty()){
            //system.debug('udatedAccountList:'+udatedAccountList);
            update udatedAccountList;
            return udatedAccountList;
        }
        return NULL;
    }

}