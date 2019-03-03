public class RamIntegration {
public string result{get;set;}
public void getAccessToken(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('https://login.salesforce.com/services/oauth2/authorize');
    request.setMethod('POST');
    request.setbody('grant_type=password&client_id=3MVG9ZL0ppGP5UrC1FvyKRCqzo.khQaVw.NAv2FVJvwhzRkvk6PbxH1j0KzjJc7SwzCeXv3akdocVNXdRC6r9&client_secret=1986462329208709749&username=ramakrishnam@anode.com&password=Anode@12345zNUpvEs83PSpCQGdJbIwG8Fu');
    HttpResponse response = p.send(request);
    result = response.getBody();
}
}