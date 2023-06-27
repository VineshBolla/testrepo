trigger ContactAccountIDTtigger on Contact (before insert) {
    contactAccountIdTriggerHandler handler = New contactAccountIdTriggerHandler();
    if(trigger.isInsert && trigger.isBefore) {
        handler.handleBeforeInsert(trigger.new);
    }
}