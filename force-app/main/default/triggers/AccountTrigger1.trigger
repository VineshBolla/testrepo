trigger AccountTrigger1 on Account (before insert) {
    AccountTriggerHandler1.beforeinsertLogic(Trigger.new);
}