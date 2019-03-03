public with sharing class PHPServiceClass {
    @future (callout=true)
    public static void callWebservice(string cont){  
        string firstname;
        string  lastname;
        List<Contact> contacts = [SELECT Id, LastName, FirstName FROM Contact WHERE Id = :cont];

       //String jsonOrders = JSON.serialize(contacts);
        for(contact c: contacts){
            firstname = c.FirstName;

            lastname = c.LastName;

        }
        // debugging call, which you can check in debug logs
       //System.debug('jsonOrders: ' + jsonOrders);
        // create an HTTPrequest object
        
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http(); 
         
        req.setMethod('POST' ); // Method Type
        req.setEndpoint('http://fsapidev.freshscreen.com/testsforce.php'); // Server Url
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded'); // Content Type
        req.setBody('FirstName=' + EncodingUtil.urlEncode(firstname, 'UTF-8') +   
        '&LastName=' + EncodingUtil.urlEncode(lastname, 'UTF-8') ); // Request Parameters*
        //req.setBody(jsonOrders);
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