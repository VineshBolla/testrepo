trigger ClosedOpportunityTrigger on Opportunity (before insert) {
	OpportunityTriggerHandler.createTaskForClosedOpportunity(Trigger.New);
}