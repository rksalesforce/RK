Global Class Total_AnnualRevenue_Batch implements Database.Batchable<SObject>, Database.Stateful{
    global Decimal TotalAnnualRevenue = 0.0;

    Global Database.QueryLocator Start(Database.BatchableContext bContext){
        String accList = 'Select id,name,AnnualRevenue from Account Where Createddate = today';
        return Database.GetQueryLocator(accList);
    }
    
    Global Void Execute(DataBase.BatchableContext bContext, List<Sobject> recordsToProcess){
        List<Account> lstAccounts = new List<Account>();
        for(Sobject acc : recordsToProcess){
            Account a = (Account) acc;
             //a.TotalAnnualRevenue__C = null;
            totalAnnualRevenue += a.annualrevenue;
            a.totalAnnualRevenue__C =totalAnnualRevenue;
            system.debug('Total Revenue ===='+ a.TotalAnnualRevenue__C);
            lstAccounts.Add(a);
        }
        update lstAccounts;
    }
    
    Global Void finish (Database.BatchableContext bContext){
   
    }
    
}