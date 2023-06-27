public class contactController1 {

    @AuraEnabled
    public static list<Contact> getcontacts(Id recordId){
        Return [SELECT Id, FirstName, LastName, Email, Phone 
                FROM Contact WHERE AccountId =: recordId];
    }
}