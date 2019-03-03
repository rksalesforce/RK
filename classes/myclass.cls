public class myclass{
   
    public static void myMethod() {
        Http p = new Http();
        Httprequest request = new HttpRequest();
        request.setEndpoint('http://mrvdairy.etisbew.us/rest/restdevservice/getMarketProviders');
        request.setMethod('GET');
        request.setHeader('Content-Type','application/json'); 
        request.setHeader('Accept','application/json');  
        HttpResponse response = p.send(request);        
        system.debug('Reponse from externalsystem'+response.getBody());
   }
}