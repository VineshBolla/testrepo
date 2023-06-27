public class CaseHistoryHandler {
    
    public void handleAfterUpdate(List<Case> oldCases, List<Case> newCases) {
        checkCaseStatus(oldCases, newCases);
    }
    
    private static void checkCaseStatus(List<Case> oldCases, List<Case> newCases) {
        List<Case_History__c> histories = new List<Case_History__c>();
        for(Integer i = 0 ; i < newCases.size() ; i++ ) {
            if(newCases[i].id == oldCases[i].id && newCases[i].priority != oldCases[i].priority) {
                histories.add(new Case_History__c(Case__c = oldCases[i].id, Case_Number__c = oldCases[i].CaseNumber, Old_value_of_Priority__c = oldCases[i].priority));
            }
        }
        
        try {
            INSERT histories;
        }catch(Exception e) {
            System.debug(e.getMessage());
        }
    } 
}