public with sharing class EmployeeSort {
    
    public static List<String> getLargeCompanies(Map<Id, Account> accMap) {
        List<String> result = new List<String>();

        for(Account acc : accMap.values()){
            if(acc.NumberOfEmployees != null && acc.NumberOfEmployees >= 100){
                result.add(acc.Name);
            }
        }

        result.sort();

        return result;
    }
}