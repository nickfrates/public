public class collectionsKata{
    // 1/12/25 Practice
    public static void nameList(List<String> names){
        
        Set<String> uniqueNames = new Set<String>(names);
        Map<String, Integer> nameCount = new Map<String, Integer>();

        for(String name : names){
            nameCount.put(name, nameCount.containsKey(name) ? nameCount.get(name) + 1 : 1);
        }

        Set<String> duplicates = new Set<String>();
        for(String name : nameCount.keySet()){
            if(nameCount.get(name) > 1) duplicates.add(name);
        }

        system.debug('Unique names: ' + uniqueNames);
        system.debug('Name frequencies: ' + nameCount);
        system.debug('Duplicates: ' + duplicates);
    }

}