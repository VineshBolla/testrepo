trigger pendiscount on Parker_pen__c (before insert) {
    pendiscounthandler.pendiscount(Trigger.New);
}