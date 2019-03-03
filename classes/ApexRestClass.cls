@RestResource (urlMapping='/AccountOperations/*')

global with sharing class ApexRestClass{
    
    @HttpGet
    
    Global static List<Account> getAccounts(){
        List<Account> acc = [select id,name from Account Limit 2];
        return acc;
    }
    
    @HttpPost
    
    Global static string putAccouunt(string Name,string accountNumber){
        Account a = new Account();
        a.Name = name;
        a.AccountNumber = accountNumber;
        insert a;
        return a.Id;
    }
    
   @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        String accId = req.requestURI.subString(req.requestURI.lastIndexof('/')+1);
        Account a = [SELECT Id from Account where Id =: accId];
        delete a;
    }
    @HttpPut
    global static Account doUpsert(string name, string AccountNumber) {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String accId = req.requestURI.subString(req.requestURI.lastIndexof('/')+1);
        Account a = [SELECT Id, Name, AccountNumber from Account where Id =: accId];        
        a.Name=name;
        a.AccountNumber=AccountNumber;        
        upsert a;
        return a;
    }

}