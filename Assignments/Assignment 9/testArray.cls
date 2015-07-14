public class testArray {
    
    Integer size;
        
    public testArray(Integer sizeOfArray){
        
        size = sizeOfArray;
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

}