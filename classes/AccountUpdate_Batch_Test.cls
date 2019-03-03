@isTest
private class AccountUpdate_Batch_Test {
     @testSetup 
    static void setup() {
   
        List<Account> accounts = new List<Account>();
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            accounts.add(new Account(name='Account '+i,billingcity='New York', billingcountry='USA'));
        }
        insert accounts;
        
    }
    static testmethod void test() {        
        Test.startTest();
        AccountUpdate_Batch uca = new AccountUpdate_Batch();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        //System.assertEquals(10, [select count() from contact where MailingCity = 'New York']);
    }
    
}