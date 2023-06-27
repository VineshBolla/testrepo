public class InvocableMethodonCase {

    @InvocableMethod
    public static void SendMailTest() {
        
        Messaging.reserveSingleEmailCapacity(5);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       
        String[] toAddresses = new String[] {'vineshbolla@gmail.com'};
       
        mail.setToAddresses(toAddresses);
        mail.setReplyTo('vineshbolla@gmail.com');
        mail.setSenderDisplayName('SalesforceSupport');
        mail.setSubject('Case is updated : ' + Case.CaseNumber);
        mail.setBccSender(false);
        mail.setUseSignature(true);
        mail.setPlainTextBody('Your Case has been updated.');
        mail.setHtmlBody('Your case has been updated to Esculated.<p>');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
        }
}