public with sharing class mathPractice {
   
    // practice on 1/3/25

    public static Decimal calculateRange(List<Decimal> nums){
        if(nums == null || nums.isEmpty()){
            return 0;
        }

        Decimal highest = nums[0];
        Decimal lowest = nums[0];

        for(Decimal d : nums){
            highest = math.max(highest, d);
            lowest = math.min(lowest, d);
        }

        return (highest - lowest) * 2;
    }

    public static Decimal calculateAverage(List<Decimal> nums){
        if(nums == null || nums.isEmpty()){
            return 0;
        }

        Decimal runningCount = 0;
        Integer positiveSumCount = 0;

        for(Decimal d : nums){
            if(d<0) continue;
            Decimal valueToAdd = d > 100 ? 100 : d;
            runningCount += valueToAdd;
            positiveSumCount += 1;
        }

        if(positiveSumCount == 0) return 0;

        Decimal average = runningCount / positiveSumCount;

        return math.round(average * 100) / 100;
    }
}