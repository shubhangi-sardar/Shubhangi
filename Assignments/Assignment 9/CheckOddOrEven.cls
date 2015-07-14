public class CheckOddOrEven {
    
    public CheckOddOrEven(Integer testNumber ){
        
        Integer num = testNumber;
        if(Math.mod(num, 2) == 0)
            System.debug(num + ' is even Number');
        else
            System.debug(num + ' is odd Number');
    }
  
}