public class http_Contacts_Controller1 {

public string responseBody{get;set;}

public http_Contacts_Controller1 (){
    
    //http Request Class
    HTTPRequest requestParam = new HTTPRequest();
    requestParam.setEndpoint(label.ContactsEndPointURL);
    requestParam.setMethod('GET');
    //HTTP Response Class
    HTTP httpParam = new HTTP();
    HTTPResponse response = httpParam.send(requestParam);
    responseBody = response.getBody();
   system.debug('@@@'+response.getbody());
 }

}