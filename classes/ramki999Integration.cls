public class ramki999Integration{
public static string accessToken{get;set;}
public static string result1{get;set;}
public static string opportunityName;
    public static void getAccessToken(){
        Http p = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://login.salesforce.com/services/oauth2/token');
        request.setMethod('POST');
        request.setBody('grant_type=password&client_id=3MVG9ZL0ppGP5UrCuYSlKnZ0GGoY7ErofKnVdIUer0ZqaGNXEns.2hkLyKKx9R8rOfueYY420kHdw.UJJEiZO&client_secret=7192863219134596202&username=prasad@anode1.com&password=07t91a0450BTsKS2pmVSkbuDWHBcOjixfd');
        HttpResponse response = p.send(request);
        string result = response.getBody();
        system.JSONParser parser = JSON.createParser(result);
        while(parser.nextValue()!=null){
            if(parser.getcurrentname()=='access_token'){
               accesstoken = parser.getText();
               system.debug('Access'+accesstoken);
            }
        }

    }
    @Future(callout=true)
    public static void insertAccount(List<id> oppid){
        getAccessToken();
        List<opportunity> opp = [select id,name,result__c from opportunity where id IN:oppid];
           
            Http p1 = new Http();
            HttpRequest request1 = new HttpRequest();
            request1.setEndPoint('https://delta1-dev-ed.my.salesforce.com//services/apexrest/sendToramki999');
            request1.setMethod('POST');
            //request1.setBody('{"name":"'+o.name+'","accountnumber":"'+o.id+'"}');
           
            for(Opportunity o :opp){
                request1.setBody('{"name":"'+o.name+'","accountnumber":"'+o.id+'"}');
            }
            system.debug('accessToken=====>'+accessToken);
            request1.setHeader('Authorization','OAuth '+accessToken);  
            request1.setHeader('content-type','application/json');
            HttpResponse response1 = p1.send(request1);
            system.debug('Reslut++'+response1);
          /*  result1 = response1.getBody();
            system.debug('ResrRespinse))))'+result1);
            system.debug('check'+opp);
            system.JSONParser parser1 = JSON.createParser(result1);
            while(parser1.nextValue()!=null){
                if(parser1.getcurrentname()=='name'){
                   opportunityName = parser1.getText();
                   system.debug('OOOOOO'+opportunityName );
                }
            }*/
            
        for(opportunity oo:opp){
           if(response1.getstatuscode() == 200){
            oo.result__C = 'Emails sent Successfully';
            }
            system.debug('&&&&&&'+oo.result__C);
        }
        update opp;
        
       }
       
    }