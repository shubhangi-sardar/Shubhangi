trigger TestTriggerOperation on Account (before insert, after insert, 
before update, after update, before delete, after delete, after undelete ) {

    if(Trigger.isBefore && Trigger.isInsert){
    	System.debug('------------------This is Before Insert Trigger');
        System.debug('--------'+ Trigger.old);
        System.debug('--------'+ Trigger.oldMap);
        System.debug('--------'+ Trigger.new);
        System.debug('--------'+ Trigger.newMap);
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
    	System.debug('-----------This is After Insert Trigger');
        System.debug('--------'+ Trigger.old);
        System.debug('--------'+ Trigger.oldMap);
        System.debug('--------'+ Trigger.new);
        System.debug('--------'+ Trigger.newMap);
        
        // Call for record cloning
        
        AccountHandler.accountHandlerMethod(Trigger.new);
    }
    
    if(Trigger.isBefore && Trigger.isUpdate){
    	System.debug('----------This is Before Update Trigger');
        System.debug('--------'+ Trigger.old);
        System.debug('--------'+ Trigger.oldMap);
        System.debug('--------'+ Trigger.new);
        System.debug('--------'+ Trigger.newMap);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
    	System.debug('-----------This is After Update Trigger');
        System.debug('--------'+ Trigger.old);
        System.debug('--------'+ Trigger.oldMap);
        System.debug('--------'+ Trigger.new);
        System.debug('--------'+ Trigger.newMap);
    }
    
    if(Trigger.isBefore && Trigger.isDelete){
    	System.debug('------------This is Before Delete Trigger');
        System.debug('--------'+ Trigger.old);
        System.debug('--------'+ Trigger.oldMap);
        System.debug('--------'+ Trigger.new);
        System.debug('--------'+ Trigger.newMap);
    }
    
    if(Trigger.isAfter && Trigger.isDelete){
    	System.debug('-----------This is After Delete Trigger');
        System.debug('--------'+ Trigger.old);
        System.debug('--------'+ Trigger.oldMap);
        System.debug('--------'+ Trigger.new);
        System.debug('--------'+ Trigger.newMap);
    }
    
    if(Trigger.isAfter && Trigger.isUndelete){
    	System.debug('---------This is After Undelete Trigger');
        System.debug('--------'+ Trigger.old);
        System.debug('--------'+ Trigger.oldMap);
        System.debug('--------'+ Trigger.new);
        System.debug('--------'+ Trigger.newMap);
    }

}