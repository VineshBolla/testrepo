public class mobiletriggerhandler{
    public static void mobilediscount(List<Mobile__c> newdiscountList1){
        for(Mobile__c dis: newdiscountlist1){
            if(dis.Brand__c == 'samsung'){
            dis.Price__c=dis.Price__c - (dis.Price__c*10)/100;
                dis.Discount_status__c='you have got 10% discount';
            }
            else if(dis.Brand__c== 'Apple'){
                dis.Price__c=dis.Price__c -(dis.Price__c*20)/100;
                dis.Discount_status__c='you have got 20% discount';
            }
        }
        
    }
}