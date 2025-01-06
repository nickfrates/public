public class binarySearch {
    
    public static Integer findAccountsByRevenue(List<Account> accounts, Decimal targetRevenue){

        if(accounts == null || accounts.isEmpty()) return -1;

        Integer left = 0;
        Integer right = accounts.size() - 1;

        while(left <= right){
            Integer mid = (left + right) / 2;
            Decimal currentRevenue = accounts[mid].AnnualRevenue;

            if(currentRevenue == targetRevenue) return mid;
            if(currentRevenue < targetRevenue) left = mid + 1;
            else right = mid - 1;

        }

        return -1;

    }


}