public class ArrayOperations {
    
    List <Integer> testArray = new List <Integer>{05, 11, 12, 11, 12, 07, 12};
    Integer sizeOfArray = testArray.size();
   /* public ArrayOperations(){
        sortAscending();
    }*/
    
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

}