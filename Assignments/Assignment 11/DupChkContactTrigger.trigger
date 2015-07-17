trigger DupChkContactTrigger on Contact (before insert, before update) {

    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
        
            DupChkContactHandler.methodContactHandler(Trigger.new);
        
        }
    
    } 

}