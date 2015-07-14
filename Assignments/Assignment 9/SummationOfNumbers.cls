public class SummationOfNumbers {
    public SummationOfNumbers(Integer testNumber){
        Integer num = testNumber, sum = 0;
        for(Integer i=testNumber; i>0; i--){
            sum = sum + i;
        }
        System.debug('Summation from 1 to ' +num+' is '+sum);
    }
}