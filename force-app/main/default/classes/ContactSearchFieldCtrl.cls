public with sharing class ContactSearchFieldCtrl {

    @AuraEnabled
    public static List<Contact> getCons(String searchVal){
        String val = '%' + searchVal + '%';
        try {
            return [SELECT Id, FirstName, LastName, Email, MobilePhone FROM Contact WHERE Name like: val LIMIT: Limits.getLimitQueryRows()];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}