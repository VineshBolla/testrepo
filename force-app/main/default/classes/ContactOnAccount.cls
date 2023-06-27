public class ContactOnAccount {
	@AuraEnabled
    public static Account getAccount(String accId){
        return [SELECT Id, Name FROM Account WHERE Id =: accId];
    }

    @AuraEnabled
    public static Contact saveCon(Contact con, String accId){
        con.AccountId = accId;
        upsert con;
        return con;
    }
}