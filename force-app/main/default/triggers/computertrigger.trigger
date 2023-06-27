trigger computertrigger on Tax_payer__c (before insert){
computertriggerhandler.capacitystatus(Trigger.new);
}