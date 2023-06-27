public class UpdateLeadSource implements Schedulable {
    
    public void execute (SchedulableContext sc) {
        List<Lead> ldList = [select Id, LeadSource from Lead];
        if(ldList.size() > 0) {
            List<Lead> newLead = new List<Lead>();
            for(Lead ld : ldList) {
                ld.LeadSource = 'Web';
                newLead.add(ld);
            }
            update newLead;
        }
    }
}