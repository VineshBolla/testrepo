public class svnpattendencehandler {
    public static void studentattendence(list<svnp_school__c>studentlist){
        list<attendence_details__c>listofattendence = new list<attendence_details__c>();
        for(svnp_school__c studentdet :studentlist){
           attendence_details__c att = new attendence_details__c();
           att.Name = studentdet.Name;
            att.jan__c = 0;
            att.feb__c = 0;
            att.dec__c = '0';
            
            //insert operation
            listofattendence.add(att);
            insert listofattendence;
        }
    }
}