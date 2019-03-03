public class RestAPIUsingWebServerAuthentication{

public string code{get;set;}
public string result{get;set;}
public string responseJSON{get;set;}
public string clientId{get;set;}
public string clientSecret{get;set;}
public string redirectURI{get;set;}
public string AccessToken{get;set;}
    
    public RestAPIUsingWebServerAuthentication(){
        redirectURI = 'https://ap5.salesforce.com/apex/restResponse';
    }
    
    public pageReference Show(){
        string url = 'https://login.salesforce.com/services/oauth2/authorize?response_type=code&';
        url = url+'client_id='+clientId;
        url = url+'&redirect_uri='+redirectURI;
        return new pageReference(url);
    }
    
    public void restCode(){
        code = ApexPages.currentPage().getParameters().get('code');
    }
    
    public void restAccessToken(){
        Http p = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Accept','application/JSON');
        request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
        request.setMethod('POST');
        string body ='grant_type=authorization_code&';
        body = body+'code='+code;
        body = body+'&client_id='+clientId;
        body = body+'&client_secret='+clientsecret;
        body = body+'&redirect_uri='+redirectURI;
        request.setBody(body);
        HttpResponse response = p.send(request);
        responseJSON = response.getBody();
        myAuth a = (MyAuth)JSON.deserialize(responseJSON,MYAuth.class);
        accessToken = a.access_token;
        
    }
    
    public class MYAuth{
        public string id;
        public string issued_at;
        public string scope;
        public string instance_url;
        public string token_type;
        public string refresh_token;
        public string id_token;
        public string access_token;
    }
}