trigger CaseHistoryTrigger on Case (after update) {
		CaseHistoryHandler handler = New CaseHistoryHandler();
    if(trigger.isUpdate && trigger.isAfter) {
        handler.handleAfterUpdate(trigger.old, trigger.new);
    }
}