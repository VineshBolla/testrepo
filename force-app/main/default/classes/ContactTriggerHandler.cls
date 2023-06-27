public class ContactTriggerHandler {
    public static void userCreation(List<Contact> newContactList){
        for(contact con: newContactList){
            if(con.age__c < 30 && con.Exp__c > 8){
                con.status__c = 'selected';
            }
        }
        
    }
    
   
    /*
public static void selectiveContactCreation(List<Contact> newContactList){
for(contact con: newContactList) {
List<account> acc = [SELECT id,(SELECT id FROM contacts) FROM account where ID = :con.AccountId];
system.debug(acc[0].contacts);
if(acc[0].contacts.size() >= 10){
con.addError('you cant add more then 10 records');
}
}
}*/
}