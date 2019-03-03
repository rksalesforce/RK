Global Class AccountUpdate_Schedule implements System.Schedulable{
    global void Execute (System.SchedulableContext SContext){
        AccountUpdate_Batch ac = new AccountUpdate_Batch();
        database.ExecuteBatch(ac);
    }
}