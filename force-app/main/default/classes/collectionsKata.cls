public with sharing class collectionsKata{
    public static void nameList(List<String> names){

        Set<String> uniqueNames = new Set<String>(names);
        Map<String, Integer> nameCount = new Map<String, Integer>();

        for(String name : names){
            nameCount.put(name, nameCount.containsKey(name) ? nameCount.get(name) + 1 : 1);
        }

        Set<String> duplicates = new Set<String>();
        for(String name : names){
            if(nameCount.get(name) > 1) duplicates.add(name);
        }

        System.debug('Unique names: ' + uniqueNames);
        System.debug('Name frequencies: ' + nameCount);
        System.debug('Duplicates: ' + duplicates);

    }
}