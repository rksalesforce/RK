@isTest
private class ETG_TestService_Test{
   
    @isTest 
    
    static void testCallout(){
    Account a = new Account();
    a.name = 'test';
    insert a;
     Test.startTest();
            ETG_TestService.insertAccount(a.id);
            a.name = 'tt';
            update a;
             Test.setMock(HttpCalloutMock.class , new MakeMockHttpResponse());
      Test.stopTest();
      a = [select name from account where id=:a.id];
      System.assertEquals('tt', a.name);

       
    }
}