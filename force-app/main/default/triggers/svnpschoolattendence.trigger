trigger svnpschoolattendence on svnp_school__c (after insert){
    svnpattendencehandler.studentattendence(trigger.new);
}