trigger AccountIntegration on Account (after insert,after delete,after update,before insert) {
 
  if(trigger.isinsert && trigger.isBefore){
     for(Account acc : trigger.new){
         integer recordcount =[select count() from Account where name=:acc.name];
        
         if(recordCount>0){
             acc.name.AddError('Records already Exist with this Name. Duplicate Records are Not Accepted.');
              
            }
          
        
     }  
  }
  
  if((trigger.isInsert) && trigger.isAfter){
    for(Account acc:trigger.new){
     //   RestIntegeration.putData(acc.id);
    // EtgIntegration_PUT.insertAccount(acc.id);
    ETG_TestService.insertAccount(acc.id);
    Dilip.insertAccount(acc.id);
    
   
    }
    
    if(trigger.isUpdate && trigger.isAfter){
        for(Account acc:trigger.old){
           // EtgIntegration_PATCH.UpdateAccount(acc.id);
           ETG_TestService.updateAccount(acc.name);
                      Dilip.updateAccount(acc.name);

        }
    }
    
  if(trigger.isdelete&& trigger.isafter){
    for(Account acc:trigger.old){
       // EtgIntegration_DELETE.DeleteAccount(acc.id);
       ETG_TestService.deleteAccount(acc.name);
              Dilip.deleteAccount(acc.name);

    }
    }
 
}
}