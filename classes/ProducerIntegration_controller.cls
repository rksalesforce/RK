public class ProducerIntegration_controller {
  public static string accesstoken;
    
@future(callout=true)
    public static void producerdetails(List<id> oppids){
        Http p = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://mrvdairy.etisbew.us/rest/restDevService/login/');
        request.setMethod('POST');
        request.setBody('{"username":"compsure","password":"3tisbew99"}');
        request.setHeader('Content-Type','application/json');
        request.setHeader('Accept','application/json');
        
        HttpResponse response = p.send(request);
        system.JSONParser parser = json.createParser(response.getBody());
        while(parser.nextValue()!=null){
            if(parser.getCurrentName()=='AUTHTOKEN'){
                accessToken = parser.getText();
            }
        }
        system.debug('Access Token ::: '+accesstoken);
      List<Opportunity> oppList = [select id,name,account.Compsure_Record_ID__c from Opportunity where id IN:oppids];
        //Get producer Data
        Http p1 = new Http();
        HttpRequest request1 = new HttpRequest();
        request1.setEndpoint('http://mrvdairy.etisbew.us/rest/restdevservice/getProducersList/804607948');
        request1.setMethod('POST');
        for(Opportunity opp : oppList){
            request1.setBody('{"searchterm": "","AUTHTOKEN": "'+accessToken+'"}');    
        }
        request1.setHeader('Content-Type','application/json'); 
        request1.setHeader('Accept','application/json');  
        request.setHeader('Content-Length', '4096');
        HttpResponse response1 = p1.send(request1);
        system.debug(response1.getBody());
    }
}