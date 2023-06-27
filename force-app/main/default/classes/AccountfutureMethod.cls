public class AccountfutureMethod {
@future
    public static void countcontacts(set<Id> AccountId){
        List<Account> updateCount = [Select Id, No_of_Contacts__c,(select Id from contacts) From Account Where id=:AccountId];
        if(updateCount !=null && !updateCount.isEmpty()){
            for(Account a : updateCount){
                a.No_of_Contacts__c =a.contacts.size();  
            }
            update updateCount;
        }
    }
}