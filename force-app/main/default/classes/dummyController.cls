public with sharing class dummyController {
    @AuraEnabled
    public static string dummyAdd(){
        Integer j = 0;
        for(Integer i = 0 ; i < 10000 ; i++ ) {
            j += i;
        }

        return String.valueOf(j);
    }
}