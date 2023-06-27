trigger OpportunityTrigger on Opportunity (before insert, after update, after delete) {
    
    OpportunityTriggerController handler = new OpportunityTriggerController();
    
    if(trigger.isInsert && trigger.isBefore) {
        handler.handleBeforeInsert(trigger.new);
    }
    
    if(trigger.isUpdate && trigger.isAfter) {
        handler.handleAfterUpdate(trigger.old, trigger.new , trigger.newMap, trigger.oldMap);
    }
    
    if(trigger.isAfter && trigger.isDelete) {
        handler.handleBeforeDelete(trigger.old);
    }
}