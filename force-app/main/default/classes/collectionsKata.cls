public class collectionsKata{

    public static void nameList(List<String> names){
        
        Set<String> uniqueNames = new Set<String>(names);
        Map<String,Integer> nameCount = new Map<String,Integer>();

        for(string name : names){
            nameCount.put(name, nameCount.containsKey(name) ? nameCount.get(name) + 1 : 1);
        }

        Set<String> duplicates = new Set<String>();
        for(String name : nameCount.keySet()){
            if(nameCount.get(name) > 1) duplicates.add(name);
        }

        system.debug('Unique names: ' + uniqueNames);
        system.debug('Name frequences: ' + nameCount);
        system.debug('Duplicates: ' + duplicates);
    }

}