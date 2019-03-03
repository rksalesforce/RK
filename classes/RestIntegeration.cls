public class RestIntegeration {

public void getAccessToken(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
    request.setMethod('POST');
    request.setBody('grant_type=password&client_id=3MVG9ZL0ppGP5UrC1FvyKRCqzo9e3lH3r5i112ckuY8QcWC2EXxe30aGl9QcdFPKOK6V0.IH3w4iwr5u9_czq&client_secret=2358361679735736129&username=ramakrishnam@anode.com&password=Anode@12345Op078jYve7w9UGgnOy2kb2abz');
    HttpResponse response = p.send(request);
    string result = response.getBody();
    system.JSONParser parser = JSON.createParser(result);
    while(parser.nextValue()!=null){
        if(parser.getcurrentname()=='access_token'){
           string accesstoken = parser.getText();
        }
    }
} 

@Future(callout=true)
public static void putData(string accid){

    Account a = [select id,name,phone,accountnumber from Account where id=:accid];
    
    string name = a.name;
    string accountnumber = a.accountnumber;
    string phone = a.phone;
    
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://ramki945-dev-ed.my.salesforce.com/services/apexrest/AccountsIntegration');
    request.setMethod('POST');
    request.setBody('{"name":"'+name+'","accountnumber":"'+accountnumber+'","phone":"'+phone+'"}');
    request.setHeader('Authorization','OAuth  00D28000001cuRz!ARkAQHQmUd3knuctosGTd2WWK00jhXOZOxMRvUgwRrQ8tbY2rkpxUbxGlmgh9n7EFwO0SbAXb8Z6MsFsA6eqQ_0zXieI.M.8');  
    request.setHeader('content-type','application/json');
    HttpResponse response = p.send(request);
    string result1 = response.getBody(); 
}
}