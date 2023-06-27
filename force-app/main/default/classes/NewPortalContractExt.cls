public class NewPortalContractExt {
    
    
    public Contract con {get;set;}
	public Account acc {get;set;}
    
    Account account;
    Contract contract;
    Order order;
    
   public void updateAccount() {
  	if(con.AccountId != null) {
    acc = [SELECT ShippingAddress, ShippingStreet FROM Account WHERE Id = :con.AccountId];
  	} else {
    acc = new Account(); // show blank value
  		}
	}
    
    
    public Account getAccount() {
      if(account == null) account = new Account();
      return account;
   }
    
    public contract getcontract() {
      if(contract == null) contract= new contract();
      return contract;
   }
    
    
    public Order getorder() {
      if(order == null) order= new order();
      return order;
   }
    
    public PageReference step1() {
      return Page.opptyStep1;
   }

   public PageReference step2() {
      return Page.opptyStep2;
   }

   public PageReference step3() {
      return Page.opptyStep3;
   }
    
    public PageReference cancel() {
      PageReference opportunityPage = new PageReference('/006');
      opportunityPage.setRedirect(true);
      return opportunityPage; 
    }
    
    

}