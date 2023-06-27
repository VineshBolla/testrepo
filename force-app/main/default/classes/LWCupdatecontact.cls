public class LWCupdatecontact {

     @AuraEnabled
    public static list<Contact> updateRecord(string contactId, string contactEmails, string contactCities){
        list<Contact> udatedContactList = new list<Contact>();
        if(contactId != Null){
            Contact conObj = new Contact();
            conObj.Id = contactId;
            conObj.Email = contactEmails;
            conObj.city__c = contactCities;
            udatedContactList.add(conObj);       
        }
        
        if(!udatedContactList.isEmpty()){
            //system.debug('udatedContactList:'+udatedContactList);
            update udatedContactList;
            return udatedContactList;
        }
        return NULL;
    }
}