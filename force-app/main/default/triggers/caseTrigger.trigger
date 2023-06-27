trigger caseTrigger on Case (before insert, before update) {
    
    caseTriggerHandler handler = New caseTriggerHandler();
    
    if(trigger.isInsert && trigger.isBefore) {
        handler.handleBeforeInsert(trigger.new);
    }
    
    if(trigger.isUpdate && trigger.isBefore) {
        handler.handleBeforeUpdate(trigger.new);
    }

}