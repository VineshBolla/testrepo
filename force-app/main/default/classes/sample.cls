public class sample {
	public string name = 'TCS';
    public string lastname = 'jack';
    public string phonenumber = '5454455555';
    public void createAccount(){
        string phone = '75586955499';
        Account acc = New Account();
        acc.Name = name;
        acc.Phone = phone;
        acc.AccountNumber = '5525456623';
        insert acc;
        system.debug('the account is added:' +acc);
    }
    
    public void createcontact(){
        List<Account> acclist = [SELECT Id, Name FROM ACCOUNT WHERE createdDate = today];
        contact c =new contact();
        c.LastName = lastname;
        c.Phone = phonenumber;
        
    }
    
    
}