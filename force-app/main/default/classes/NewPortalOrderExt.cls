public class NewPortalOrderExt {
    
    // SObject to store order record details.
    public Order orderObj {get; set;}
    
    public CustomLookup_Controller ordrStpWrap {get;set;}

    public NewPortalOrderExt() {
        orderObj = new Order();
    }

    // Remote Action method that is called from the VF page to fetch lookup field data.
    @RemoteAction
    public static List<customData> getLookupData(String searchTerm, String lookupFieldApiName){
       
        List<sObject> recordList = new List<sObject>();

        List<customData> dataList = new List<customData>();

        try {

            if(String.isNotBlank(searchTerm) && String.isNotBlank(lookupFieldApiName)) {

                String referenceToObj;

                String nameField;

                // Get the contact fields using schema.
                Map<String, Schema.SObjectField> contactFieldMap = Schema.getGlobalDescribe().get('Contact').getDescribe().fields.getMap();

                for(Schema.SObjectType fieldRef : contactFieldMap.get(lookupFieldApiName.trim()).getDescribe().getReferenceTo()) {

                    // Object Name of which lookup field has reference to is stored
                    referenceToObj = fieldRef.getDescribe().getName();
                }

                
                // Fetch the fields of the reference object 
                Map<String, Schema.SObjectField> lookupObjMap = Schema.getGlobalDescribe().get(referenceToObj).getDescribe().fields.getMap();

                for (SObjectField f: lookupObjMap.values()){
                    
                    if(f.getDescribe().isNameField()){
                           
                           // Name field of the reference object is stored in this.
                           nameField = f.getDescribe().getName();
                    }
                }
                
                
                searchTerm= '%'+searchTerm+'%';

                // Dynamic query is created to get the matching records for the lookup field.
                String query  = 'Select Id, '+nameField+' From ' + referenceToObj + ' Where '+nameField+' LIKE \'' + searchTerm + '\' ORDER BY CreatedDate Desc LIMIT 10';

                recordList = Database.query(query);

                if(!recordList.isEmpty()) {

                    for(sObject obj : recordList){

                        // The details of matching records are stored in list of wrapper(customData) object and returned to Visualforce page.
                        dataList.add(new customData(String.valueOf(obj.get(nameField)), obj.Id ) );
                    }

                    return dataList;

                } else {

                    return null;
                }

                
            }

            return null;

        }

        catch(Exception e){
            
            System.debug('Exception in getLookupData method');
            System.debug('Exception message: '+e.getMessage());
            System.debug('Exception Line Number: '+e.getLineNumber());
            System.debug('Exception Cause: '+e.getCause());
            System.debug('Exception StackTrace: '+e.getStackTraceString());

        }

        return null;


    }

    // Method used to create new contact record.
    public void createNewOrder(){

        try{

            insert orderObj;
            //system.debug('orderObj' +orderObj);
           

        } catch(Exception e){

            System.debug('Exception in createNewOrder method');
            System.debug('Exception message: '+e.getMessage());
            System.debug('Exception Line Number: '+e.getLineNumber());
            System.debug('Exception Cause: '+e.getCause());
            System.debug('Exception StackTrace: '+e.getStackTraceString());
        }
        
       
    }
    
    public PageReference goToNewPortalOrder() {
         return Page.NewPortalOrder;
   }
    
    public PageReference goToNewPortalContract() {
         return Page.NewPortalContract;
   }


    // Wrapper class to store the data of matching records for lookup field.
    public class customData {
        public String Name;
        public String Id;

        public customData(String Name, Id Id){
            this.Name = Name;
            this.Id = Id;
        }
    }

}