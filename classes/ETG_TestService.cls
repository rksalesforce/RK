public class ETG_TestService {
public static string accessToken{get;set;}
public static string result{get;set;}
public static string result2{get;set;}

public static void getAccessToken(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
    request.setMethod('POST');
    request.setBody('grant_type=password&client_id=3MVG9d8..z.hDcPL_legfqWtXViEJP6AHqNwTAQCNzTi4MVwdMtbKlHuVNh6788yF86cPCnsylD5UcAHF4sy1&client_secret=3496778593744153613&username=admin@etg.com&password=etg@1234gPXRSvWuuIFhXDJj20Ry5Qoe');
    HttpResponse response = p.send(request);
    result = response.getBody();
   
    system.JSONParser parser = JSON.createParser(response.getBody());
    while(parser.nextValue()!=null){
        if(parser.getCurrentName()=='access_token'){
          accessToken = parser.getText();
        }
    }
}

//Insert Account
@Future(callout=true)
public static void insertAccount(string accid){
    getAccessToken();
    Account acc = [select id,name,phone,rating from Account where id=:accid];
    string name = acc.name;
    string phone = acc.phone;
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://ap5.salesforce.com/services/apexrest/testService');
    request.setHeader('content-type','application/json');
    request.setHeader('Authorization','OAuth '+accessToken+'');
    request.setMethod('POST');
    request.setBody('{"name":"'+name+'","phone":"'+phone+'"}');
    HttpResponse response = p.send(request);
    result2 = response.getBody();
    system.debug('@@@@'+result);
   
}

//Update Account
@future(Callout=true)
  public static void updateAccount(string accname){
    getAccessToken();
    
    Account acc = [select id,name,phone from Account where name=:accname];
     system.debug('TEST:'+acc.name);
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://ap5.salesforce.com/services/apexrest/testService/'+accname+'?_HttpMethod=PATCH');
    string url ='https://ap5.salesforce.com/services/apexrest/testService/'+accname+'?_HttpMethod=PATCH';
    system.debug('###'+url);
    request.setHeader('content-type','application/json');
    request.setHeader('Authorization','OAuth '+accessToken+'');
    request.setMethod('POST');
    request.setBody('{"name":"'+acc.name+'","phone":"'+acc.phone+'"}');
    HttpResponse response = p.send(request);
}
//Delete Account
@Future(Callout=true)
public static void deleteAccount(string accname){
     getAccessToken();
     Http p = new Http();
     HttpRequest request = new HttpRequest();
     string url = 'https://ap5.salesforce.com/services/apexrest/testService/'+accname+'';
     request.setEndPoint(url);
     system.debug('@@@@'+url);
     request.setHeader('Content-Type', 'application/json');
     request.setHeader('Authorization','OAuth '+accessToken+'');
     request.setMethod('DELETE');
     HttpResponse response = p.send(request);
}
}