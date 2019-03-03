public class Compsure_SendEmail_Controller{
public static string accessToken{get;set;}
public static string result{get;set;}
public static string result1{get;set;}
public static string Response_message;

@future(callout=true)
public static void sendEmail(id oppid){
   Http p = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('http://mrvdairy.etisbew.us/rest/restDevService/login/');
        request.setMethod('POST');
        request.setHeader('Content-Type','application/json');
        request.setHeader('Accept','application/json');
        request.setBody('{"username":"compsure","password":"3tisbew99"}');
        HttpResponse response = p.send(request);
        system.debug('==========>'+response.getBody());
        system.debug('Response'+response);
        result = response.getBody();
        system.debug('Result'+result);
        system.JSONParser parser = JSON.createParser(response.getBody());
        while(parser.nextValue()!=null){
            if(parser.getCurrentName()=='AUTHTOKEN'){
                accessToken = parser.getText();
            }
        }
        system.debug('AccessToken'+accessToken);
   /* opportunity opp = [select id,name,stageName,account.Compsure_Record_ID__c,Opportunity_Number__c,Expiration_Date__c from Opportunity where id=:oppid];
    system.debug('#####'+opp);
    system.debug('/////'+opp.account.Compsure_Record_ID__c);
    system.debug('+++++'+opp.expiration_date__C);
    date expirationdate = opp.Expiration_Date__c;
    
    system.debug('DEadLine'+expirationdate);
    date rfpenddate = opp.Expiration_Date__c.AddDays(-21);
    system.debug('DEadLine==1'+rfpenddate);
    date marketrequestdeadline= opp.Expiration_Date__c.AddDays(-80);
    system.debug('MarketingDEadLine'+marketrequestdeadline);
    
    //Send Opportunity Data
    Http p1 = new Http();
    HttpRequest request1 = new HttpRequest();
    //string body1 = label.informproducerEndpoint+opp.account.Compsure_Record_ID__c;
    //system.debug('BODY'+body1);
    //request1.setEndpoint(label.informproducerEndpoint+opp.account.Compsure_Record_ID__c);
    request1.setMethod('POST');       
    string body ='{"OPPORTUNITYNUMBER": "'+opp.Opportunity_Number__c+'","expirationdate": "'+expirationdate+'","rfpenddate": "'+rfpenddate+'","marketrequestdeadline": "'+marketrequestdeadline+'","authToken":"'+accessToken+'"}';
    system.debug('Body'+body);
    request1.setHeader('Content-Type','application/json');
    request1.setHeader('Accept','application/json');
    request1.setBody('{"OPPORTUNITYNUMBER": "'+opp.Opportunity_Number__c+'","expirationdate": "'+expirationdate+'","rfpenddate": "'+rfpenddate+'","marketrequestdeadline": "'+marketrequestdeadline+'","authToken":"'+accessToken+'"}');
            
    HttpResponse response1 = p1.send(request1);
    system.debug('Response1 is===>>>'+response1);
    result1 = response1.getBody();
    system.debug('Result1===>>>'+result1);
    
    system.JSONParser parser1 = JSON.createParser(response1.getBody());
    
         while(parser1.nextValue()!=null){
            if(parser1.getCurrentName()=='SUCCESS'){
                if(parser1.getText()!='true'){
                Response_Message = parser1.getText();  
                system.debug('Message++++++'+Response_Message);
                }
                
            }
    }*/
       
}
}