public class SimpleInterest {
    
    public SimpleInterest(Double principle, Double rate, Double years){
        
        Double prncpl = principle;
        Double rt = rate;
        Double yrs = years;
        
        Double simpleInterest = (principle*rate*years)/100;
        System.debug('Simple Interest is : '+simpleInterest);
    }

}