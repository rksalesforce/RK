Global Class AccountUpdate_Batch implements Database.Batchable<SObject>{
    Global Database.QueryLocator Start(DataBase.BatchableContext bContext){
        String lstAccounts = 'select id,name,rating,createdDate from Account Where CreatedDate = today';
        return DataBase.GetQueryLocator(lstAccounts);
    }
    
    Global void Execute(Database.BatchableContext bContext, List<Sobject> recordsToProcess){
       
        List<Account> accList = new List<Account>();
        
        for(Sobject acc:recordsToProcess){
            Account ac = (Account)acc;
            ac.rating = Null;
            ac.annualRevenue=10;
            accList.Add(ac);
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
    
    Global void finish(DataBase.BatchableContext bContext){
    system.debug('Batch Job id is.....: '+ bContext.getJobId());
        
        AsyncApexJob jobDetails = [select id, status, numberoferrors,totaljobitems,
                                  jobitemsprocessed, createdby.email from AsyncApexJob 
                                  where id =: bContext.getJobId()];
    }
}