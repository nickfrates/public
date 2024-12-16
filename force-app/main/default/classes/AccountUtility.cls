public with sharing class AccountUtility {
    
    public static Map<String, Integer> countAccountsByIndustry(List<Account> accounts){

        Map<String, Integer> industryCount = new Map<String, Integer>();
        Map<String, Integer> result = new Map<String, Integer>();

        for(Account acc : accounts){
            if(acc.industry!=null){
                industryCount.put(acc.industry, industryCount.containsKey(acc.industry) ? industryCount.get(acc.industry) + 1 : 1);
            }
        }

        for(String industry : industryCount.keySet()){
            if(industryCount.get(industry) > 1){
                result.put(industry, industryCount.get(industry));
            }
        }

        return result;
    }
    
}