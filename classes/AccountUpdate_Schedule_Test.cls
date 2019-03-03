@isTest
private class AccountUpdate_Schedule_Test
{

    static testmethod void schedulerTest() 
    {
        String CRON_EXP = '0 0 0 15 3 ? *';
        
        // Create your test data
        Account acc = new Account(name= 'test');
        insert acc;
        Test.startTest();
            String jobId = System.schedule('ScheduleApexClassTest',  CRON_EXP, new AccountUpdate_Schedule());
        Test.stopTest();
    }
}