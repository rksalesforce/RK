public with sharing class Util{

    @future (callout=true)
    public static void callWebservice(SET<Id> cont){       

        List<Contact> contacts = [SELECT Id, LastName, FirstName FROM Contact WHERE Id = :cont];

        String jsonOrders = JSON.serialize(contacts);

        // debugging call, which you can check in debug logs
        System.debug('jsonOrders: ' + jsonOrders);
        // create an HTTPrequest object
        Http h = new Http();
        HttpRequest req = new HttpRequest();

        // set up the HTTP request with a method, endpoint, header, and body      
        req.setMethod('POST');  
        req.setEndpoint('http://fsapidev.freshscreen.com/testsforce.php');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');

        req.setBody(jsonOrders);    
        // create a new HTTP object
        

        System.debug('Request Data '+ req);

        // create a new HTTP response for receiving the remote response      
        HTTPResponse res = h.send(req);

        // debugging call, which you can check in debug logs
         System.debug('Fulfillment service returned '+ res.getBody());


         System.debug('getStatusCode '+ res.getStatusCode());

        // If status code != 200, write debugging information, done
        if (res.getStatusCode() != 200) {
            System.debug('Error from ' + req.getEndpoint() + ' : ' + res.getStatusCode() + ' ' + res.getStatus());
        }        

    }
}