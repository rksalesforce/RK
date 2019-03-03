public class SendMessage {
public string message{get;set;}
Account acc;
    public SendMessage(ApexPages.StandardController controller) {
        acc = (Account)controller.getRecord();
    }
public void sendMessage(){
    Http p = new Http();
    HttpRequest request = new HttpRequest();
    string url = 'https://api.textlocal.in/send?apiKey=70UxHIch0fk-b2Nl0nuuM9iD2BvwaGkHWcy7P0FNbZ&message='+message+'&numbers='+acc.phone;
    request.setEndPoint(url);
    request.setMethod('GET');
    HttpResponse response = p.send(request);
    if(response.getstatuscode()==200){
       ResponseWrapper resWrap = (ResponseWrapper)JSON.deserialize(response.getBody(),ResponseWrapper.class);
           if(resWrap.status=='success'){
               ApexPages.Message msg = new ApexPages.Message(apexpages.severity.confirm,'Message Delivered, remaining balance :'+resWrap.balance);
               Apexpages.AddMessage(msg);
           }
           else{
               ApexPages.Message msg = new ApexPages.Message(apexpages.severity.Error,'Message Not Delivered, remaining balance :'+resWrap.balance);
               Apexpages.AddMessage(msg);       
           }
        }
           else{
               ApexPages.Message msg = new ApexPages.Message(apexpages.severity.Error,'Message Not Delivered with error :'+response.getBody());
               Apexpages.AddMessage(msg);       
           }

}
public class ResponseWrapper{
    public string status{get;set;}
    public integer balance{get;set;} 
}
}