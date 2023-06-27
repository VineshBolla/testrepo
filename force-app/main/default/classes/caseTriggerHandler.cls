public class caseTriggerHandler {
    
    public void handleBeforeInsert(List<Case> newCaseList) {
        changeCaseDescription(newCaseList);
    }
    
    public void handleBeforeUpdate(List<Case> newCaseList) {
        changeCaseDescription(newCaseList);
    }
    
    private static void changeCaseDescription(List<Case> newCaseList) {
        Set<Id> accountIds = new Set<Id>();
        for(Case newCase : newCaseList) {
            if(String.isNotBlank(newCase.accountId)) {
                accountIds.add(newCase.accountId);
            }
        }
        
        Map<Id, Account> accountIdMap = new Map<Id, Account>([SELECT Id, City__c FROM Account WHERE Id IN:accountIds]);
        
        for(Case newCase : newCaseList) {
            if(String.isNotBlank(newCase.accountId)) {
                if(String.isNotBlank(newCase.priority) && newCase.priority == 'High' && accountIdMap.get(newCase.accountId).city__c == 'Redwood city') {
                    newCase.description = 'High priority case from Redwood city.'; 
                }
            }
        }
    }
}