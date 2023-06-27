public class ContactRelatedListController {     

    public List<contact> contacts{get;set;} 

    public Account accounts {get;set;} 

    public Account acc {get;set;} 
    

    public ContactRelatedListController(ApexPages.StandardController controller) { 
        acc = (account)controller.getRecord();      
        accounts = [SELECT id FROM account WHERE id=: acc.id LIMIT 1]; 
        contacts = [SELECT Id,Name,phone,email FROM Contact WHERE accountid =:accounts.id ORDER BY Name];     
} 

    public pageReference newContact(){  
 	pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/003/e?&retURL=' + accounts.id);  
        return pageRef; 
    } 

    public pageReference editContact(){  
 	String contactId = Apexpages.currentpage().getParameters().get('contactId');  
 	pageReference pageRef = new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/' + contactId + '/e?retURL=' + accounts.id);  
        return pageRef;  
    }    

    public pageReference deleteContact(){  
   String contactId = Apexpages.currentpage().getParameters().get('contactId');  
        contact contactList = [SELECT Id FROM contact WHERE id = : contactId LIMIT 1]; 
        delete contactList; 
        String baseUrl = URL.getSalesforceBaseUrl().toExternalForm(); 
        PageReference redirectPage = new PageReference(baseUrl+'/'+accounts.id); 
        return redirectPage;  
    }   
    
}