trigger mobiletrigger on Mobile__c (before insert, before update){
    if(Trigger.isinsert==true && Trigger.isbefore==true){
        mobiletriggerhandler.mobilediscount(Trigger.new);
    }
    if(Trigger.isupdate==true && Trigger.isbefore==true){
        mobiletriggerhandler.mobilediscount(Trigger.new);
}
}