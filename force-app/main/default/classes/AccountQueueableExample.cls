public class AccountQueueableExample implements Queueable {
     
    public void execute(QueueableContext context) {
        List<Account> accList = [select Id, Name from Account];
        for(Account acc :accList){
            // Update the Account Name 
            acc.Name = acc.Name + 'Test';
        }
        update accList;
    }
}