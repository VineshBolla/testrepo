public class contactAccountIdTriggerHandler {
	public void handleBeforeInsert(List<Contact> newContacts) {
        contactcreation(newContacts);
    }
    
    public static Void contactcreation(List<Contact> newContacts){
       	AccountId__c accountIdSetting = AccountId__c.getInstance();
        System.debug(accountIdSetting.Id);
        Account acc = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id =: accountIdSetting.AccountId__c];
        if(acc != null) {
            Integer contactCount = acc.contacts.size() == 0 ? 0 : acc.contacts.size() - 1;            
            for(Integer i = 0 ; i < newContacts.size() ; i++ ) {
                accountIdSetting = AccountId__c.getInstance();
                if(contactCount < 9) {
                    newContacts[i].AccountId = accountIdSetting.AccountId__c;
                    contactCount++;
                }else {
                    contactCount = 0;
                    
                    Account newAccount = new Account(name = 'account-'+accountIdSetting.AccountId__c);
                    INSERT newAccount;
                    
                    accountIdSetting.AccountId__c = newAccount.Id;
                    UPSERT accountIdSetting;
                    
                    newContacts[i].AccountId = newAccount.Id;
                }
            }
        }    
    }
}