public class Dilip{
public static string accessToken{get;set;}
public static string result{get;set;}
public static string result2{get;set;}


public static void getAccessToken(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
    request.setMethod('POST');
    request.setBody('grant_type=password&client_id=3MVG9pe2TCoA1Pf58JTPGvRkJIYy2QK7hBjKoubYCMXyLP9xG0ieVak9oKBnpsWFsDBG3eTTMXNqtSc3sKDm6&client_secret=081BDED185144D3FB65B6195A73F9EB46B1E3DBCF6E5F253D1C58DBDC66AC2FF&username=ram@nimbus.com&password=nimbus881rp2Kb0Bfnx2TE45H9jkOGUa');
    HttpResponse response = p.send(request);
    result = response.getBody();
    system.JSONParser parser = JSON.createParser(result);
    while(parser.nextValue()!=null){
        if(parser.getcurrentname()=='access_token'){
            accesstoken = parser.getText();
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
    request.setEndPoint('https://ap5.salesforce.com/services/apexrest/dilip');
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