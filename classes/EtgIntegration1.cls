public class EtgIntegration1 {
public string result{get;set;}
public string accessToken{get;set;}
public string JsonString{get;set;}
public string result2{get;set;}
public List<consolewrap> ConsoleWrapperList{get;set;}

public void getAccessToken(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
    request.setMethod('POST');
    request.setBody('grant_type=password&client_id=3MVG9d8..z.hDcPL_legfqWtXVttTD7gFk1WVdeosB4ChqLx5G4iLcPU0BubQyH0.30hSactWfpnpqMznnKgG&client_secret=597031981549196269&username=admin@etg.com&password=etg@1234SWJtmWw6DR2xz0XHnflyCfYWH');
    HttpResponse response = p.send(request);
    result = response.getBody();
    system.JSONParser parser = JSON.createParser(result);
    while(parser.nextValue()!=null){
        if(parser.getCurrentName()=='access_token'){
            accessToken = parser.getText();
        }
    }
}

@future(callout=true)
public static void insertAccount(string id){
    Account a = [select id,name,accountnumber from account where id =:id];
    string name = a.name;
    string accountnumber = a.accountnumber;
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://ap5.salesforce.com/services/apexrest/myAccountOperations');
    request.setHeader('Content-Type', 'application/json');
    request.setHeader('Authorization','OAuth 00D7F000005B0sq!AQsAQMvAKm9yPuVRr38Jg__VTtOTHCcBLsBOIG8YchBWtws6zWj13v.StegJ_JUlMpKuaYJo7hrgxcnQI5ESddXxBNB7Ntcs');
    request.setMethod('POST');
    request.setBody('{"name":"'+name+'","accountnumber":"'+accountnumber+'"}');
    HttpResponse response = p.send(request);
    string result2 = response.getBody(); 
    
}
public List<consolewrap> getperformcallout(){

ConsoleWrapperList = new List<consolewrap>();


    Http p = new Http();
    HttpRequest request1 = new HttpRequest();
    request1.setEndPoint('https://ap5.salesforce.com/services/apexrest/myAccountOperations');
    request1.setMethod('GET');
    request1.setHeader('Authorization','OAuth '+accesstoken+'');
    HttpResponse response1 = p.send(request1);
    JSONString = response1.getBody();
    

if(response1.getstatusCode() == 200 && response1.getbody() != null){

ConsoleWrapperList=(List<consolewrap>)json.deserialize(response1.getbody(),List<consolewrap>.class);

}

return consolewrapperlist;

}
public class consolewrap {

public String name{get;set;}
public String accountnumber{get;set;}
public String Email{get;set;}

}

public void save(){
    List<Account> accList = new List<Account>();
    for(consolewrap wrp :consolewrapperlist ){
        Account acc = new Account();
        acc.name = wrp.name;
        acc.accountnumber = wrp.accountnumber;
        accList.Add(acc);
    }
    if(!accList.isEmpty()){
        insert accList;
    }
}
}