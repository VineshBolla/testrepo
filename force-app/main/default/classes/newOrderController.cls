public class newOrderController {
    
    Contract contract;
   	Order order;
    
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
                Map<String, Schema.SObjectField> contactFieldMap = Schema.getGlobalDescribe().get('Contract').getDescribe().fields.getMap();

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

   public Contract getContract() {
      if(contract == null) contract = new Contract();
      return contract;
   }

   public Order getOrder() {
      if(order == null) order = new Order();
      return order;
   }

   public PageReference step1() {
      return Page.opptyStep1;
   }

   public PageReference step2() {
      return Page.opptyStep2;
   }

   public PageReference step3() {
      return Page.opptyStep3;
   }

    public PageReference cancel() {
      PageReference orderPage = new PageReference('/801');
      orderPage.setRedirect(true);
      return orderPage; 
    }

   public PageReference save() {

      try{

            insert contract;
            system.debug('contract' +contract);

        } catch(Exception e){

            System.debug('Exception in createNewContract method');
            System.debug('Exception message: '+e.getMessage());
            System.debug('Exception Line Number: '+e.getLineNumber());
            System.debug('Exception Cause: '+e.getCause());
            System.debug('Exception StackTrace: '+e.getStackTraceString());
        }

      order.accountId = contract.accountId;
      order.ContractId = contract.Id;
      insert order;


      PageReference orderPage = new ApexPages.StandardController(order).view();
      orderPage.setRedirect(true);

      return orderPage;
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