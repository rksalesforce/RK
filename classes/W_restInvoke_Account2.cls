public class W_restInvoke_Account2 {

    public string result{get;set;}
    public string accessToken{get;set;}
    public string result1{get;set;}
    public List<JSON2Apex> d2{get;set;}
    
    public void Show(){
        Http p = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
        request.setMethod('POST');
        request.setBody('grant_type=password&client_id=3MVG9ZL0ppGP5UrC1FvyKRCqzo2874Xmsuy6sANOzUhxZ5TUAi.Fcn1D1zg8t4hPiOVYhfKNDLQd4CLb1wDpn&client_secret=266627257487208991&username=ramakrishnam@anode.com&password=Anode@12345fJqKj6Rt1NveqRubjOEolurIO');
        HttpResponse response = p.send(request);
        result = response.getBody();
        system.JSONParser parser = JSON.createParser(result);
        while(parser.nextValue()!=Null){
            if(parser.getcurrentName()=='access_token'){
                accessToken = parser.getText();
            }
        }
        
        HttpRequest request1 = new HttpRequest();
        request1.setEndPoint('https://ramki945-dev-ed.my.salesforce.com/services/apexrest/RestAccount2d');
        request1.setmethod('GET');
        request1.setHeader('content-type','application/json    ');
        request1.setHeader('Authorization','Bearer '+accessToken);
        HttpResponse response1 = p.send(request1);
        result1 = response1.getBody();
        
        d2=(List<JSON2Apex>)JSON.deSerialize(result1,List<JSON2Apex>.class);
    }
 public class JSON2Apex{
     public string name{get;set;}
     public string phone{get;set;}
     public string industry{get;set;}
     public string id{get;set;}
 }
 
 public void save(){
     List<Integration_Test__c> lstRecords = new List<Integration_Test__c>();
     
     for(JSON2Apex a:d2){
         Integration_Test__c t = new Integration_Test__c();
         t.name=a.name;
         t.phone__C=a.phone;
         t.Id__C =a.Id;
         lstRecords.Add(t);
     }
     if(!lstRecords.isEmpty()){
         insert lstRecords;
     }
 }
}