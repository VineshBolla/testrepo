public with sharing class Calculator {

    @AuraEnabled(cacheable=true)
    public static List<dataWrapper> getWrappedContactData(){
        return wrapData([SELECT id, FirstName, LastName, Email, Profit__c, Lose__c, Cost__c FROM Contact]);
    }

    private static List<dataWrapper> wrapData(List<Contact> contacts) {
        List<dataWrapper> wrappedData = new List<dataWrapper>();
        if(contacts != null && !contacts.isEmpty()) {
            for(Contact contact : contacts) {
                Decimal totalAmountSpent = contact.Cost__c == null || contact.Profit__c == null ? null : contact.Cost__c - contact.Profit__c;
                if(totalAmountSpent != null) {
                    wrappedData.add(new dataWrapper(contact.Profit__c, contact.cost__c, totalAmountSpent, JSON.serialize(contact)));
                }
            }
        }
        return wrappedData;
    }

    public class dataWrapper {
        @AuraEnabled public Decimal profit;
        @AuraEnabled public Decimal cost;
        @AuraEnabled public Decimal totalAmountSpent;
        @AuraEnabled public String serializedRecordData;
        public dataWrapper(Decimal profit, Decimal cost, Decimal totalAmountSpent, String serializedRecordData) {
            this.cost = cost;
            this.profit = profit;
            this.totalAmountSpent = totalAmountSpent;
            this.serializedRecordData = serializedRecordData;
        }
    } 
}