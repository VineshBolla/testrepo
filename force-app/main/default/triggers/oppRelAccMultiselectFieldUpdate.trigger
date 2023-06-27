trigger oppRelAccMultiselectFieldUpdate on Opportunity (after update){
Set<Id> accId = new Set<Id>();
Map<Id,String> countryMap = new Map<Id,String>();
for(Opportunity opp : Trigger.new) {
if(opp.ABCDF__c!=Trigger.oldMap.get(opp.Id).ABCDF__c){
if(opp.AccountId!=null){
countryMap.put(opp.AccountId,opp.ABCDF__c);
accId.add(opp.AccountId);
}
}
}
List<Account> accUpdateList = new List<Account>();
List<Account> accList = [select Id,ABCDF__c from Account where Id=: accId];
if(accList.size()>0){
for(account a: accList){
if(countryMap.containsKey(a.Id)){
String c=countryMap.get(a.Id);
a.ABCDF__c=c;
accUpdateList.add(a);
}
}
}
if(accUpdateList.size()>0){
update accUpdateList;
}
}