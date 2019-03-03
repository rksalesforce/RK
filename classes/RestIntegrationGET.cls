public class RestIntegrationGET {
public string result{get;set;}
public string accesstoken{get;set;}
public string result1{get;set;}
public string JSONResult{get;set;}

public void getAccesstoken(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
    request.setMethod('POST');
    request.setBody('grant_type=password&client_id=3MVG9ZL0ppGP5UrC1FvyKRCqzo9e3lH3r5i112ckuY8QcWC2EXxe30aGl9QcdFPKOK6V0.IH3w4iwr5u9_czq&client_secret=2358361679735736129&username=ramakrishnam@anode.com&password=Anode@12345Op078jYve7w9UGgnOy2kb2abz');
    HttpResponse response = p.send(request);
    result = response.getBody();
    
    system.JSONParser parser =JSON.createParser(result);
    while(parser.nextValue()!=null){
        if(parser.getcurrentname()=='access_token'){
            accesstoken = parser.getText();
        }
    }
    HttpRequest request1 = new HttpRequest();
    request1.setEndPoint('https://ramki945-dev-ed.my.salesforce.com//services/data/v41.0/sobjects/Account/0010I00001hxeo7');
    request1.setMethod('GET');
    request1.setHeader('Authorization','OAuth '+accesstoken+'');
    //request1.setHeader('content-type','application/json');
    HttpResponse response1 = p.send(request1);
    result1=response1.getBody();
    system.JSONParser parser1 =JSON.createParser(result1);
    while(parser1.nextValue()!=null){
        if(parser1.getcurrentname()=='Name'){
            JSONResult= parser1.getText();
        }
    }
}
}