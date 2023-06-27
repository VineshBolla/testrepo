@isTest
private class UpdateLeadSourceTest{
    
    @testSetup
    static void setUp() {
        List<Lead> ldsList = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            Lead ld = new Lead(LastName = 'LN' + i, LeadSource = 'Web', Company = 'Comp' + i, Status = 'Open - Not Contacted');
            ldsList.add(ld);
        }
        insert ldsList;
    }
        
        static testMethod void test1() {
            String sch = '0 0 0 * * ?';
            Test.startTest();
            // Schedule the test job
            String jobId = System.schedule('Update LeadSource to Web', sch, new UpdateLeadSource());
                
            List<Lead> ldList = [select Id from Lead limit 200];
            system.assertEquals(200, ldList.size());    
            
            // Stopping the test will run the job synchronously
        Test.stopTest();
    }
}