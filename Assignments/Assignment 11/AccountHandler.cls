public with sharing class AccountHandler {
	
	public static Boolean firstCloneDone = True;
	
	public static void accountHandlerMethod(List <Account> accountInstance ){
	
	    List <Account> copyOfAccountInstance = new List <Account>();
	    for(Account a : accountInstance){
	        copyOfAccountInstance.add(a.clone(False, True, True, False));
	        if(firstCloneDone){
	            
	            firstCloneDone = False;
	            Insert copyOfAccountInstance;
	        }
	        
	   }
	    
	}

}