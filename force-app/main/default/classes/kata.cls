public class kata{

    public static boolean isPrime(integer maybePrime){

        if(maybePrime < 2){
            return false;
        }

        for(integer i = 2; i < math.sqrt(maybePrime); i++){
            if(math.mod(maybePrime, i) == 0){
                return false;
            }
            
        }
        return true;
    }


}