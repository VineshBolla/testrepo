public class computertriggerhandler {
    public static void capacitystatus(list <Tax_payer__c> newpayerlist){
        for(Tax_payer__c cap: newpayerlist){
            if(cap.RAM__c < 2 && cap.Processer__c < 2 && cap.Hdisk__c < 50){
                cap.load_capacity__c = 'low capacity';
            } 
        }
        
    }
}