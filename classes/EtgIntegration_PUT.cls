public class EtgIntegration_PUT {

public static string accessToken{get;set;}

public static void getAccessToken(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
    request.setMethod('POST');
    request.setBody('grant_type=password&client_id=3MVG9d8..z.hDcPL_legfqWtXVttTD7gFk1WVdeosB4ChqLx5G4iLcPU0BubQyH0.30hSactWfpnpqMznnKgG&client_secret=597031981549196269&username=admin@etg.com&password=etg@1234SWJtmWw6DR2xz0XHnflyCfYWH');
    HttpResponse response = p.send(request);
    system.JSONParser parser = JSON.createParser(response.getBody());
    while(parser.nextValue()!=null){
        if(parser.getCurrentName()=='access_token'){
          accessToken = parser.getText();
        }
    }
}


@future(callout=true)
public static void insertAccount(string id){
    getAccessToken();
    Account a = [select id,name,accountnumber from account where id =:id];
    system.debug('TEST:'+a.id);
    string name = a.name;
    string accountnumber = a.accountnumber;
    string accid = a.id;
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://ap5.salesforce.com/services/apexrest/myAccountOperations');
    request.setHeader('Content-Type', 'application/json');
    request.setHeader('Authorization','OAuth '+accessToken+'');
    request.setMethod('POST');
    request.setBody('{"name":"'+name+'","accountnumber":"'+accountnumber+'","accid":"'+id+'"}');
    HttpResponse response = p.send(request);
    string result2 = response.getBody(); 
    
}

}