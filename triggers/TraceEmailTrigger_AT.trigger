trigger TraceEmailTrigger_AT on TraceEmail__c (after insert, after update) {
    List<ID> canIDToUpdate = new List<ID>();
    for(TraceEmail__C te:trigger.new){
        if(te.NoOfTimesEmailOpened__C >2 && te.Contact__C!=NULL){
            canIdToUpdate.add(te.contact__C);
        }
    }
    if(!canIdToUpdate.isEmpty()){
    
    }
}