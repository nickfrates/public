public with sharing class AccountUtil {
    // 1.19.25 update
    public static List<String> getAccountsWithLargeEmployeeCount(List<Account> accounts){

        List<String> result = new List<String>();

        if (accounts == null) return result;

        for(Account acc : accounts){

            if(acc.NumberOfEmployees != null && acc.NumberOfEmployees > 100){
                result.add(acc.Name);
            }

        }

        result.sort();

        return result;

    }

}