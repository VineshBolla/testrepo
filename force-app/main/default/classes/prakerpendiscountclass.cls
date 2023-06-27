public class prakerpendiscountclass{
    public static void applydiscount(list<Parker_pen__c> VarpenlistNew){
        for(Parker_pen__c varp: varpenlistNew){
            if(varp.price__c >=100){
               varp.price__c = varp.price__c-20;
            }    
        }
    }
}