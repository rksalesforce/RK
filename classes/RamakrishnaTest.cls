@isTest
Public class RamakrishnaTest{
static testMethod void testaccountInsert(){
        
        //RestRequest req = new RestRequest(); 
        //RestResponse res = new RestResponse();
       // req.requestURI = '/services/apexrest/AccountIntegration';  
       /* req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;
        */
        Test.startTest();
        //Ramakrishna results = new Ramakrishna();
        Ramakrishna.accountInsert('rk','tt');
        Ramakrishna.accountrecords();
        Test.stopTest();
        

    }   
    
  }