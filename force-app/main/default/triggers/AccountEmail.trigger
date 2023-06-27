trigger AccountEmail on Account (after insert){
    
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    
    User userObj=[select Id,Profile.Name,Email from user where Profile.Name='System Administrator'];
    for(Account accObj:Trigger.new){
       
        if(userObj.Email!=null){
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           
            mail.setSenderDisplayName('Salesforce');
            mail.toAddresses = new String[]{userObj.Email};
                
                mail.setSubject('New Account was Created.');
            
            String body = 'Dear System Administrator, <br/>';
            body += 'An account has been created and name is '+accObj.Name+'.';
            
            mail.setHtmlBody(body);
           
            mails.add(mail);
        }
    }
    if(!mails.isEmpty()){
            Messaging.sendEmail(mails);
    } 
    
}