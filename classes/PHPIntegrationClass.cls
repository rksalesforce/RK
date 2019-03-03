public with sharing class PHPIntegrationClass {
@future(callout=true)
public static void insertContact(string cont){
    
         Contact c = [SELECT Id, LastName, FirstName FROM Contact WHERE Id = :cont]; 
        String jsonOrders = JSON.serialize(c);
        string firstname = c.FirstName;
        string  lastname = c.LastName;
        // Sening the http body with JSON 
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://fsapidev.freshscreen.com/testsforce.php');
        req.setMethod('POST');            
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded'); // Content Type application/x-www-form-urlencoded
        //req.setBody(jsonOrders);
        req.setBody('{"FirstName":"'+firstname+'","LastName":"'+lastname+'","AccessToken":"UD98983KLMADC99", "UserID":"1234","PWD":"Welcome3TG"}');
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        try {
            res = http.send(req);
            if(res.getBody() != null){
                // Parse Response
                System.debug('Sucess:'+res.getBody());
            }
        } catch(Exception e) {
            System.debug('error: '+ e);
        }
        
        // If status code != 200, write debugging information, done
        if (res.getStatusCode() != 200) {
            System.debug('Error from ' + req.getEndpoint() + ' : ' + res.getStatusCode() + ' ' + res.getStatus());
        }        

    }
}
/*
 String jsonOrders = JSON.serialize(contacts);
        for(contact c: contacts){
            firstname = c.FirstName;
            lastname = c.LastName;
        }
        // debugging call, which you can check in debug logs
      System.debug('jsonOrders: ' + jsonOrders);
        // create an HTTPrequest object
       req.setEndpoint('http://fsapidev.freshscreen.com/testsforce.php'); // Server Url 
         req.setBody('FirstName=' + EncodingUtil.urlEncode(firstname, 'UTF-8') +   
       '&LastName=' + EncodingUtil.urlEncode(lastname, 'UTF-8') ); // Request Parameters
        //
        
        req.setBody(jsonOrders);  
        JSONGenerator gen = JSON.createGenerator(true);    
        gen.writeStartObject();
        gen.writeStringField('FirstName',c.FirstName);
        gen.writeStringField('LastName',c.LastName);
        gen.writeStringField('AccessToken','UD98983KLMADC99');
        gen.writeStringField('UserID','1234');
        gen.writeStringField('PWD','Welcome3TG');
        gen.writeEndObject();
        String jsonS = gen.getAsString();
        
        System.debug('jsonMaterials'+jsonS);
         */