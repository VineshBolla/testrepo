public class OpportunityTriggerHandler {
    Public static void createTaskForClosedOpportunity(List<Opportunity> newOpportunitylist){
        for(Opportunity closedOpportunity: newOpportunitylist){
            if (closedOpportunity.StageName == 'Closed Won'){
              Task t = New Task();
                t.whatId = closedOpportunity.id;
                t.Subject = 'Follow Up Test Task';
               INSERT t;
            }
        }
    }
}