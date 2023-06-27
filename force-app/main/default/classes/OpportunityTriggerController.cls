public class OpportunityTriggerController {
    public void handleBeforeInsert(List<Opportunity> newOpportunities) {
        checkOpportunityStatus(newOpportunities);
    }
    
    
    
    public void handleAfterUpdate(List<Opportunity> oldOpportunities, 
                                   List<Opportunity> newOpportunities,
                                   Map<Id, Opportunity> newOpportunitiesMap, 
                                   Map<Id, Opportunity> oldOpportunitiesMap) {
        checkOpportunityStatus(oldOpportunities, newOpportunities);
    }
    
    
    
    public void handleBeforeDelete(List<Opportunity> deletedOpportunities) {
        handleDelete(deletedOpportunities);
    }
    
    
    
    
    private static void handleDelete(List<Opportunity> deletedOpportunities) {
        Set<Id> opportunityIds = new Set<Id>();
        Set<Id> relatedCaseIds = new Set<Id>();
        
        for(Opportunity opp : deletedOpportunities) {
            opportunityIds.add(opp.Id);
            relatedCaseIds.add(opp.Case__c);
        }
        
        List<Case> caseWithRelatedOpportunities = [SELECT Id, Number_Of_Open_Oppoturnities__c, is_Opportunity_Active__c, (SELECT Id, StageName, case__c FROM Opportunities__r WHERE StageName != 'Closed Won' AND StageName != 'Closed Lost') FROM Case WHERE Id IN:relatedCaseIds];
        
        if(!caseWithRelatedOpportunities.isEmpty()) {
            for(Case caseRecord : caseWithRelatedOpportunities) {
                caseRecord.Number_Of_Open_Oppoturnities__c = caseRecord.Opportunities__r.size();
                if(caseRecord.Opportunities__r.size() != 0) {
                 	caseRecord.is_Opportunity_Active__c = true;   
                }else {
                    caseRecord.is_Opportunity_Active__c = false;
                }
            }
            
            try {
                UPDATE caseWithRelatedOpportunities;
            } catch(Exception e) {
                System.debug(e.getMessage());
            }
        }
    }
    
    
    
    private static void checkOpportunityStatus(List<Opportunity> newOpportunities) {
        Set<Id> caseIds = new Set<Id>();
        for(Opportunity newOpp : newOpportunities) {
            if(newOpp.StageName != 'Closed Won' || newOpp.StageName != 'Closed Lost' && String.isNotBlank(newOpp.case__c)) {
                caseIds.add(newOpp.case__c);
            }
        }
        List<Case> caseRecords = [SELECT Id, Number_Of_Open_Oppoturnities__c, is_Opportunity_Active__c FROM Case WHERE Id IN: caseIds];
        for(Case caseRecord : caseRecords) {
         	caseRecord.Number_Of_Open_Oppoturnities__c = caseRecord.Number_Of_Open_Oppoturnities__c == null ? 1 : caseRecord.Number_Of_Open_Oppoturnities__c++;  
            caseRecord.is_Opportunity_Active__c = true;
        }
        
        UPDATE caseRecords;
    }
    
    
    
    private static void checkOpportunityStatus(List<Opportunity> oldOpportunities, List<Opportunity> newOpportunities) {
        Set<Id> opportunityIds = new Set<Id>();
        Set<Id> relatedCaseIds = new Set<Id>();
        
        for(Integer i = 0 ; i < oldOpportunities.size() ; i++ ) {
            if(oldOpportunities[i].Id == newOpportunities[i].Id && oldOpportunities[i].StageName != newOpportunities[i].StageName && String.isNotBlank(newOpportunities[i].case__c)) {
                opportunityIds.add(newOpportunities[i].Id);
                relatedCaseIds.add(newOpportunities[i].case__c);
            }
        }
        
        List<Case> caseWithRelatedOpportunities = [SELECT Id, Number_Of_Open_Oppoturnities__c, is_Opportunity_Active__c, (SELECT Id, StageName, case__c FROM Opportunities__r WHERE StageName != 'Closed Won' AND StageName != 'Closed Lost') FROM Case WHERE Id IN:relatedCaseIds];
        
        if(!caseWithRelatedOpportunities.isEmpty()) {
            for(Case caseRecord : caseWithRelatedOpportunities) {
                caseRecord.Number_Of_Open_Oppoturnities__c = caseRecord.Opportunities__r.size();
                if(caseRecord.Opportunities__r.size() != 0) {
                 	caseRecord.is_Opportunity_Active__c = true;   
                }else {
                    caseRecord.is_Opportunity_Active__c = false;
                }
            }
            
            try {
                UPDATE caseWithRelatedOpportunities;
            } catch(Exception e) {
                System.debug(e.getMessage());
            }
        }
    }        
}