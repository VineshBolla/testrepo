public class AccountTriggerHandler {
    String CITYABREVATIONS = 'NEW YORK, NY, NYC';
    public void handleAfterInsert(List<Account> newAccounts) {
        Set<Id> accountsToUpdate = new Set<Id>();
        for(Account account : newAccounts) {
            if(CITYABREVATIONS.containsIgnoreCase(account.city__c) && account.Is_New_York_Account__c == false && account.Status__c == 'Approved') {
                accountsToUpdate.add(account.Id);
            }
        }
        updateAccountAndContactToRequiredState(accountsToUpdate);
    }
    public void handleAfterUpdate( List<Account> oldAccounts, List<Account> newAccounts, Map<Id, Account> oldAccountMap, Map<Id, Account> newAccountMap) {
        Set<Id> accountsToUpdate = new Set<Id>();
        for(integer i = 0 ; i < newAccounts.size() ; i++ ) {
            if(oldAccounts[i].Id == newAccounts[i].Id && oldAccounts[i].city__c != newAccounts[i].city__c && CITYABREVATIONS.containsIgnoreCase(newAccounts[i].city__c) && newAccounts[i].Is_New_York_Account__c == false && newAccounts[i].Status__c == 'Approved') {
                accountsToUpdate.add(newAccounts[i].Id);
            }
        }
        updateAccountAndContactToRequiredState(accountsToUpdate);
    }

    private static void updateAccountAndContactToRequiredState(Set<Id> accountToBeUpdated) {
        List<Account> accountsWithContacts = [SELECT Id,city__c, (SELECT Id, city__c FROM Contacts) FROM Account WHERE Id IN: accountToBeUpdated];
        Set<Id> contactIdsToUpdateContact = new Set<Id>();

        List<Account> accountUpdateList = new List<Account>();
        List<Contact> contactUpdateList = new List<Contact>();

        for(Account account : accountsWithContacts) {
            accountUpdateList.add(new Account(Id=account.Id ,Is_New_York_Account__c = true));
            if(account.contacts != null && account.Contacts.size() > 0) {
                for(Contact contact : account.Contacts) {
                    if(!contactIdsToUpdateContact.contains(contact.id)) {
                        contactIdsToUpdateContact.add(contact.id);
                        contactUpdateList.add(new Contact(Id = contact.Id, city__c = account.city__c));
                    }                    
                }
            }
        }
        UPDATE accountUpdateList;
            UPDATE contactUpdateList;
    }
}