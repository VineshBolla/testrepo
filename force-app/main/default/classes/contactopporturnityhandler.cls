public class contactopporturnityhandler {
    public static void oppcreation(list<contact> oppaddition){
        list<Opportunity> opptoinsert = New list<Opportunity>();
        for(contact contactlist : oppaddition){
            if(contactlist.LastName !=null){
               Opportunity oppupdate = New Opportunity();
               oppupdate.Name = contactlist.LastName;
               oppupdate.StageName = 'Needs Analysis';
               oppupdate.CloseDate = Date.newInstance(2022, 2, 17);
               oppupdate.ContactId = contactlist.id; 
               opptoinsert.add(oppupdate); 
            }
        }
        INSERT opptoinsert;
    }
}