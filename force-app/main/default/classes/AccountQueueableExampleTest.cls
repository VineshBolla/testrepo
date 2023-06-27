@isTest
public class AccountQueueableExampleTest {

    @IsTest
    static void test1(){
        Test.startTest();
        System.enqueueJob(new AccountQueueableExample());
        Test.stopTest();
        
        Account acc1 = [select Id, Name from Account limit 1];
        System.assertNotEquals(acc1.Name + 'Test', acc1.Name);
    }
    
}