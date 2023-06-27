public class UpdateContactAddress implements Database.Batchable<sObject>, Database.Stateful {

    public integer recordsProcessed = 0;
    
    public Database.QueryLocator start (Database.BatchableContext bc) {
        String query = 'select Id, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, (select Id, MailingStreet, MailingCity, MailingState, MailingCountry, MailingPostalCode from Contacts) from Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Account> scope) {
       
        List<Contact> contacts = new List<Contact>();
        for(Account acc : scope) {
            for(Contact con : acc.contacts) {
                con.AccountId = acc.Id;
                con.MailingStreet = acc.BillingStreet;
                con.MailingCity = acc.BillingCity;
                con.MailingState = acc.BillingState;
                con.MailingPostalCode = acc.BillingPostalCode;
                contacts.add(con);
                
                recordsProcessed = recordsProcessed + 1;
            }
        }
        update contacts;
    }
    public void finish(Database.BatchableContext bc) {
        
        AsyncApexJob job = [select Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =: bc.getJobId()];
        
    }
}