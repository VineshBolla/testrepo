public with sharing class ContactController {
        @AuraEnabled(cacheable=true)
        public static List<Contact> findContactByAccountId(string accId){
            return [SELECT Id,LastName,FirstName,Email, AccountId FROM Contact WHERE AccountId=:accId];
        }
    }