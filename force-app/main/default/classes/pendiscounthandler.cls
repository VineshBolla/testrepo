public class pendiscounthandler {
    public static void pendiscount(list<Parker_pen__c> discountlist){
        for(Parker_pen__c dis:discountlist){
            if(dis.price__c>200 && dis.quantity__c>2){
                dis.discount__c='u have got 10% discount';
            }
        }
    }
}