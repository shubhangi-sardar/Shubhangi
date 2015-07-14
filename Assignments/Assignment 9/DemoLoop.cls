public class DemoLoop {
   List <Account> accountObj = [Select Id, Name From Account];
    public void loopDemo(){
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
}