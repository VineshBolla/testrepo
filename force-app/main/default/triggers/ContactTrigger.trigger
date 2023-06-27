trigger ContactTrigger on Contact (before insert) {
ContactTriggerHandler.userCreation(Trigger.New);
   /* contactTriggerHandler.selectiveContactCreation(Trigger.New); */
}