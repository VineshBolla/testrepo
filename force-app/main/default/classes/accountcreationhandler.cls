public class accountcreationhandler {
    public static void creation(List<Account> accounts){
        List<Contact> contactsToInsert = new List<Contact>();
        for(Account accountupdate : accounts) {
            // Check if the account satifies the following criteria for child creation.
            if(accountupdate.NumberofLocations__c != null && accountupdate.NumberofLocations__c > 0) {
                // Create NumberofLocations__c amount of contacts
                for(Integer i = 0 ; i < accountupdate.NumberofLocations__c ; i++ ) {
                    Contact newContact = new Contact();
                    newContact.LastName = accountupdate.Name + i;
                    newContact.AccountId = accountupdate.Id;
                    contactsToInsert.add(newContact);
                }
            }
        }
        INSERT contactsToInsert;
    }
}