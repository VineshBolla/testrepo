trigger AccountTrigger on Account (after insert, after update) {
    AccountTriggerHandler handler = new AccountTriggerHandler();
    if(trigger.isInsert && trigger.isAfter) {
        handler.handleAfterInsert(trigger.new);
    }
    if(trigger.isUpdate && trigger.isAfter) {
        handler.handleAfterUpdate(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
}