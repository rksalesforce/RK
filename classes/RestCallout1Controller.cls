public class RestCallout1Controller {
public string response{get;set;}
public MyWrapper responseBody{get;set;}

public void makeCallout(){
    
    string endpUrl = 'https://jsonplaceholder.typicode.com/posts/1';
    Http htp = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpUrl);
    req.setMethod('GET');
    
    HttpResponse res = htp.send(req);
    response = res.getBody();
    responseBody = (MyWrapper)JSON.deserializestrict(res.getBody(),MyWrapper.class);
    system.debug('%%%%'+responsebody);
}

public class MyWrapper{
    public integer userid{get;set;}
    public integer id{get;set;}
    public string title{get;set;}
    public string body{get;set;}
    
 
}

}