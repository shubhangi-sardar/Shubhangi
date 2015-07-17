public class ArrayOperations {
    
    List <Integer> testArray = new List <Integer>{05, 11, 12, 11, 12, 07, 12};
    Integer sizeOfArray = testArray.size();
   /* public ArrayOperations(){
        sortAscending();
    }*/
    
    public void methodCheckOddOrEven(Integer testNumber ){
        
        Integer num = testNumber;
        if(Math.mod(num, 2) == 0)
            System.debug(num + ' is even Number');
        else
            System.debug(num + ' is odd Number');
    }
    
    public void testArray(Integer sizeOfArray){
        
        Integer size = sizeOfArray;
        List <Integer> sampleList = new Integer[size];
        Integer indexValue = 11;
        System.debug('Size of Array is : '+size);
        System.debug('Array Values are :');
        for(Integer i=0; i<size; i++){
            sampleList[i]=indexValue;
            System.debug('Index '+i+' is '+sampleList[i]);
            indexValue++;
        }
        
    }
    
    
    public void sortAscending(){
        System.debug('Array in Ascending Order : ');
        Integer temp, i;
        for(i=0;i<sizeOfArray;i++){
            for(Integer j=i+1;j<sizeOfArray;j++){
                if(testArray[j]<testArray[i]){
                    temp = testArray[i];
                    testArray[i] = testArray[j];
                    testArray[j] = temp;
                }
             }
            System.debug(testArray[i]);
         }
     }
        
    public void sortDescending(){
        System.debug('Array in Descending Order : ');
        Integer temp, i;
        for(i=0;i<sizeOfArray;i++){
            for(Integer j=i+1;j<sizeOfArray;j++){
                if(testArray[j]>testArray[i]){
                    temp = testArray[i];
                    testArray[i] = testArray[j];
                    testArray[j] = temp;
                }
             }
            System.debug(testArray[i]);
         }
     }
    
     public void maxNumberInArray(){
        Integer maxNumber, i;
        maxNumber = testArray[0];
        for(i=1;i<sizeOfArray;i++){
            if(maxNumber>testArray[i])
               maxNumber = maxNumber;
            else
               maxNumber = testArray[i];
        }
        System.debug('Maximum number in Array is : '+maxNumber); 
     }

    public void minNumberInArray(){
        Integer minNumber, i;
        minNumber = testArray[0];
        for(i=1;i<sizeOfArray;i++){
            if(minNumber<testArray[i])
               minNumber = minNumber;
            else
               minNumber = testArray[i];
        }
        System.debug('Minimum number in Array is : '+minNumber); 
     }
    
    public void dupOccuranceInArray(){
        List <Integer> temp = testArray;
        Integer i, j, count = 0;
        for(i=0;i<sizeOfArray;i++){
            if(temp[i] == -1)
                continue;
            for(j = i; j<sizeOfArray;j++){
               
                    if(temp[i] == temp[j]){
                        count++;
                         if(i != j)
                             temp[j]=-1;
                    }
             
            }
            System.debug('Array Element '+temp[i]+' occured '+count+' times.');
            count = 0;
            
        }
    }
    
    public void summationOfNumbers(Integer testNumber){
        Integer num = testNumber, sum = 0;
        for(Integer i=testNumber; i>0; i--){
            sum = sum + i;
        }
        System.debug('Summation from 1 to ' +num+' is '+sum);
    }
    
    public void simpleInterest(Double principle, Double rate, Double years){
        
        Double prncpl = principle;
        Double rt = rate;
        Double yrs = years;
        
        Double simpleInterest = (principle*rate*years)/100;
        System.debug('Simple Interest is : '+simpleInterest);
    }
    
    
    public void loopDemo(){
        List <Account> accountObj = [Select Id, Name From Account];
        Integer i;
    	for(i = 0; i<accountObj.size(); i++){
            System.debug('Traditional For Loop ' +accountObj[i]);
        }
        
        for(Account a: accountObj ){
            System.debug('For Each Loop ' +a);
        }
        
        for(Account a : [Select Id, Name From Account]){
            
            System.debug('Advanced For Loop ' + a);
        }
        
        i=0;
        while(i<accountObj.size()){
            System.debug('While Loop ' +accountObj[i]);
            i++;
        }
    }
    
    public void demoSet(){
        Set <Lead> leadRecords = new Set <Lead>([Select Id, Name From Lead]);
        //leadRecords = [Select Id, Name From Lead];
        for(Lead i : leadRecords){
            System.debug('Lead Record '+ i);
        }
    }
    
    public void testFunctionLead(){
        List<Lead> leadList = [Select Id, Name, Status FROM Lead WHERE Status = 'Closed - Not Converted'];
        System.debug(leadList);
        for(Lead L : leadList){
            L.Status = 'Status changed';
        }
        Update LeadList;
        System.debug(LeadList);
    }

    
       

}