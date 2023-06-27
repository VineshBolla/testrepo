public with sharing class ProcessBuilderHelper {
    @invocableMethod 
    public static void printName(List<String> names) {
        //just to print
        System.debug('Hello' + String.join(names, ', ') + '.');
    }
}