public class SendSMSExtension {
public string message{get;set;}

Contact con;

    public SendSMSExtension(ApexPages.StandardController controller) {
        con = (Contact)controller.getRecord();
        
    }
    
public void sendSMS(){

    Http htp = new Http();
 string targetString = EncodingUtil.URLENCODE(message,'UTF-8');
    string endpoint = 'https://api.textlocal.in/send/?apiKey=W1izpi31OYQ-MBEkJZDTxoUZ2CRCTUkgYyLvwUVSwA&message='+targetString+'&numbers='+con.MobilePhone+'&senders=TXTLCL';
    system.debug('==endpoint=='+endpoint);
    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpoint);
    req.setMethod('GET');
    HttpResponse res = htp.send(req);
    system.debug('==resBody=='+res.getBody());
    if(res.getstatuscode()==200){
       ResponseWrapper resWrap = (ResponseWrapper)JSON.deserialize(res.getBody(),ResponseWrapper.class);
       if(resWrap.status=='success'){
       
       Apexpages.Message msg = new ApexPages.message(ApexPages.severity.confirm,'Message delivered,remaining balance:'+resWrap.balance);
       Apexpages.addmessage(msg);
       }
       else{
       Apexpages.Message msg = new ApexPages.message(ApexPages.severity.error,'Message not delivered,remaining balance:'+resWrap.balance);
       Apexpages.addmessage(msg);
     }
     }
     else{
       Apexpages.Message msg = new ApexPages.message(ApexPages.severity.error,'Message not delivered with error:'+res.getBody());
       Apexpages.addmessage(msg);
    
     }
}


public class ResponseWrapper{
    public string status{get;set;}
    public integer balance{get;set;}
}
}