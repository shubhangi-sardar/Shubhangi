public with sharing class DupChkContactHandler {
	
	public static void methodContactHandler(List <Contact> contactList){
	
	    List <Contact> conList = [Select Phone, Email From Contact];
	    
	    for(Contact c : contactList){
	    	for(Contact c1 : conList){
	    		if((c.Phone == c1.Phone) || (c.Email == c1.Email))
	    		    c.addError('Email Or Phone Already Exist');
	    	}
	       // [Select c.Phone, c.Email From Contact Where c.AssistantPhone OR c.Email IN (conList)];
	    }
	
	}

}