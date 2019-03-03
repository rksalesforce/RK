@isTest
Public class MixedDMLExceptionTestClassTest
{
    testmethod static void TestDMLOperation()
    {
        Profile p = [select id, name from profile where name = 'Standard User'];
        User u = new User(firstname='test',lastname='userrec', username = 'david.dodson@gmail1.com', isActive=true, email='ferozjani@gmail.com', alias='testuser',EmailEncodingKey='UTF-8', LanguageLocaleKey='en_US', 
        LocaleSidKey='en_US', ProfileId = p.Id,         TimeZoneSidKey='America/Los_Angeles');
        
        Account a = new Account(name='Query String Test',rating='Hot',Industry='Banking',active__C='Yes',annualrevenue=400000,type='prospect', website='www.test.com');
        
        Test.startTest();
            insert u;
            insert a;
        
            MixedDMLExceptionTestClass.DoDMLOperations();
        
        Test.StopTest();
    }
}