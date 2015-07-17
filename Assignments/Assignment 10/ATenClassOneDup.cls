public class ATenClassOneDup {
	
	public void methodOne(){
	    List <Contact> contacts = [Select Id, Name, OwnerID From Contact];
	    for(Contact c : contacts){
	        System.debug(c);
	    }
	}
	
	public void methodTwo(){
        Map<Id, User> myMap = new Map<Id, User>();
        List <User> usr = [Select Id, Name From User Where IsActive = True];
        for(User u : usr){
      	    myMap.put(u.Id, u);
      	    
      	}
        System.debug(myMap);
      
      
    }
    
     public void methodThree(){
        Map<String, Id> myMap1 = new Map<String, Id>();
        Map<Id, String> myMap2 = new Map<Id, String>();
        
        List <Account> acc = [Select Id, Name From Account];
        for(Account a : acc){
            myMap1.put(a.Name, a.Id);
            
        }
        System.debug(myMap1);
        for(Account a : acc){
            myMap2.put(a.Id, a.Name);
            
        }
        System.debug(myMap2);
    }
    
    public void methodFour(){
    	List <Account> acc1 = [Select Id, Name, Enrollment_Year__c 
    						   From Account 
    						   Where Enrollment_Year__c Includes('2010')];
    	for(Account a : acc1){
    	    System.debug('Account Records having Enrollment Year 2010 '+a);
    	}
    	List <Account> acc2 = [Select Id, Name, Enrollment_Year__c 
    	                       From Account 
    	                       Where Enrollment_Year__c Includes('2013', '2014')];
    	for(Account a : acc2){
    	    System.debug('Account Records having Enrollment Year 2013 and 2014  '+a);
    	}
    }    
    
    public void methodFive(){
        List <Account> acc = [Select Id, Name, BillingState 
                              From Account
                              Where BillingState NOT IN ('kerala', 'Maharashtra')
                              Order By BillingState DESC NULLS LAST LIMIT 20];
        for(Account a : acc){
            System.debug(a);
        }
    }
    
    public void methodSix(){
        List <Opportunity> opp = [Select Id, Name, AccountId, Amount, CreatedDate 
                              From Opportunity
                              Where Amount > 50000
                              Order By CreatedDate ASC NULLS LAST LIMIT 40 OFFSET 10 ALL ROWS];
        for(Opportunity o : opp){
            System.debug(o);
        }
    }
    
     /*   public void testAggrFunctionOne{
        List <AggregateResult> ar1 = [Select SUM(Amount) TotalSum, CloseDate
                              From Opportunity
                              Where (StageName Like 'Closed%') 
                              AND CloseDate = THIS_FISCAL_YEAR
                              Group By CloseDate
                              ];
        
       Map<Double, Date> myMap = new Map<Double, Date>();
        
       //Integer year = Date().THIS_FISCAL_YEAR;
       for(AggregateResult ar : ar1){
            myMap.put(Double.valueOf(ar.get('TotalSum')), Date.valueOf(ar.get('CloseDate')));
        }
        System.debug(myMap); 
        
        //for(AggregateResult ar : ar1)
        //System.debug(ar); 
    } */
    
    
    public void testAggrFunctionTwo(){
        List <AggregateResult> ar2 = [Select COUNT_DISTINCT(Name) CountLead, LeadSource
                                      From Lead
                                      Group By LeadSource
                                      Having COUNT_DISTINCT(Name) > 2 
                                     ];
        
       for (AggregateResult ar : ar2) {
			System.debug('Distict Lead Count' + ar.get('CountLead'));
			System.debug('LeadSource' + ar.get('LeadSource')); 
        
       }
     }
    
    
     public void testAggrFunctionThree(){
        Map<String,Map<String,Integer>> mLeadMap = new Map<String,Map<String,Integer>>();
         
        List <AggregateResult> ar2 = [Select COUNT_DISTINCT(Id) CountLead, LeadSource, Status
                                      From Lead
                                    Group By LeadSource, Status
                                     ];
        
       for (AggregateResult ar : ar2) {
           if(!mLeadMap.containsKey(String.valueOf(ar.get('LeadSource')))){
               mLeadMap.put(String.valueOf(ar.get('LeadSource')),new Map<String,Integer>{String.valueOf(ar.get('Status')) => Integer.valueOf(ar.get('CountLead'))});
           }
              else{
                  mLeadMap.get(String.valueOf(ar.get('LeadSource'))).put(String.valueOf(ar.get('Status')),Integer.valueOf(ar.get('CountLead')));
              }
			//System.debug('Distict Lead Count' + ar.get('CountLead'));
			//System.debug('LeadSource' + ar.get('LeadSource')); 
           // System.debug('Lead Status' + ar.get('Status'));
                  
       }
              System.debug(' mLeadMap' + mLeadMap);
     }
     
     
     public void methodEleven(){
        List <Contact> contacts = [Select Name, Account.Name , Account.Industry 
                                   from Contact 
                                   Where Account.Industry = 'Media' AND Is_Active__c = True];
        for(Contact c : contacts)
             System.debug(c.Account.Name);
           //System.debug(c.Name+' '+c.Account.Name+' '+c.Account.Industry);
    }
    
    public void methodTwelve(){
        List <Object_3__c> obj3 = [Select Name, Object_1__r.Name, Object_2__r.Name
                                   From Object_3__c
                                   Where Name = 'John'];
        for(Object_3__c o3 : obj3)
            System.debug(o3.Name+' '+o3.Object_1__r.Name+' '+o3.Object_2__r.Name);
    }
    
    public void methodThirteen() {
         List<Account> accountList = [SELECT Id, Name, (SELECT Name FROM Contacts WHERE Name LIKE '%John%')
                                      FROM Account 
                                      WHERE Id IN (SELECT AccountId FROM Contact WHERE Name LIKE '%John%')];
         for(Account a : accountList)
             System.debug(a+' '+ Contact.Name);
    }
    
     
    public void methodFourteen() {
        List <Account> acc = [Select Id, Name 
                                   From Account 
                                   Where Id IN (Select AccountId From Opportunity Where StageName = 'Closed Won')];
         for(Account a : acc){
            System.debug(a);
         }
    }
    
     public void methodFifteen() {
        List <Object_1__c> object1List = [Select Id, Name, (Select Name, Object_2__c From Object_3__r) 
                                         From Object_1__c
                                         Where Object_1__c.Id IN (Select Object_1__c From Object_3__c Where Name = 'John')];
         for(Object_1__c obj1 : object1List){
            System.debug(obj1.Id+' '+ obj1.Name + ' '+ Object_3__c.Name +' '+ Object_2__c.Name);
         }
    }
    
    public void testFunctionSOSL(){
        
        List <List<sObject>> sobjList = [Find 'test' 
                                         In All Fields 
                                         Returning Account(Id,Name),Contact(Id,Name),Lead(Id,Name),User(Id,Name)];
        system.debug(sobjList);
    }
    
    
     public void leadErrorLogs(){
        
        List <Lead> leadList = new List <Lead>();
        //List <Log__c> logList = new List <Log__c>();
        //List <String> errorFieldList = new List <String>();
        for(Integer i = 1; i<=10;i++){
            leadList.add(new Lead(Lead_Name__c = 'Test Lead '+ i, FirstName = 'John', LastName = 'Smith', Company = 'Eternus', Status = 'Open - Not Contacted' ));
        }
        leadList.add(new Lead(Lead_Name__c = 'Test Lead 10', FirstName = 'John', LastName = 'Smith', Company = 'Eternus', Status = 'Open - Not Contacted' ));
        
        try{
            insert leadList;
        }
        catch(DMLException e)
        { 
            Log__c logInstance =new Log__c( Error_Message__c = e.getMessage());
            insert logInstance;
            System.debug('Exception Occurred: ' + e.getMessage());
        
        }
        
        
        /* Database.SaveResult[] saveResultList = Database.insert(leadList, false);
        
        for (Database.SaveResult sr : saveResultList) {
      if (sr.isSuccess()) {
        System.debug('Record inserted successfully. Lead ID: ' + sr.getId());
      }
      else {
        for(Database.Error errorLogs : sr.getErrors()) {
                    
                   statusCode sc= errorLogs.getStatusCode();
                   System.debug(sc);
                    // String nm = sc.;
                    //System.debug(errorLogs.getStatusCode() + ': ' + errorLogs.getMessage());
                   //errorFieldList = errorLogs.getFields();   
                   //String errmsg = errorLogs.getMessage();
          //logList.add(new Log__c (Error_Message__c = errorLogs.getMessage(), Error_Field__c = errorLogs.getFields()));
          //insert logList;
        }
      }
    }*/
    }
    
    public void deleteInactiveAccount(){
        
        List <Account> accountList = [Select Name From Account Where CreatedDate = LAST_90_DAYS AND Active__c = 'No'];
        for(Account a: accountList){
            System.debug(a);
            delete a;
        }
    }
    
        public void operationOnAsset(){
            List <Asset> assetList = [Select Name, Line_Item_ID__c, AccountId From Asset];
            /*for(Integer i = 10; i<=18;i++){
                assetList.add(new Asset(Name = 'Test '+i, AccountId = '00128000003vQBE', Line_Item_ID__c = '13'+i ));
            }*/
            assetList.add(new Asset(Name = 'Test 8',  AccountId = '00128000003vQBE', Line_Item_ID__c = '164'));
            //Upsert assetList Line_Item_ID__c;
             try{Upsert assetList Line_Item_ID__c;}
             catch(Exception e){
                  system.debug('Exception Occured:'+e);
             }
        } 

}