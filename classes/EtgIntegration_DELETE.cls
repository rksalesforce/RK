public class EtgIntegration_DELETE {
public static string accessToken;

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
public static void deleteAccount(string id){
    getAccessToken();
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://ap5.salesforce.com/services/apexrest/myAccountOperations/'+id+'');
    request.setHeader('Content-Type', 'application/json');
    request.setHeader('Authorization','OAuth '+accessToken+'');
    request.setMethod('DELETE');
    HttpResponse response = p.send(request);
   /* string result2 = response.getBody(); 
    system.debug('JSON RESULT::::::'+result2);
    */
}

}