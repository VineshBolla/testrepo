public class methodDeclaration {
	public integer intt =0;
    
    public void checking(){
        system.debug('im a method...!');
    }
    public void displayaccount(string navar, integer i, contact con){
        system.debug('the string:'+navar);
        system.debug('the integer:'+i);
        system.debug('the contact:'+con);
    }
    public void displaybulk(string navar, integer i, Account a, list<contact> c){
        system.debug('the string:'+navar);
        system.debug('the integer:'+i);
        system.debug('the account:'+a);
        system.debug('the contact:'+c);
    }
}