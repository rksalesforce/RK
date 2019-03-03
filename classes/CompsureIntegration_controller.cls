public class CompsureIntegration_controller{
    
    public static string accesstoken{get;set;}
    public static string Response_Message;
    public static string result{get;set;}
    public static string result1{get;set;}
    public static string CompsureUSERID{get;set;}
    
    @auraEnabled
    public static ErrorMessageHandler  InsertAccount(id accId){
        
        Http p = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('http://mrvdairy.etisbew.us/rest/restdevService/login');
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
        
        system.debug(accessToken);
        Account acc = [select id,name,owner.name,Register_Date__c,selected_states__C,billingstreet,billingcity,billingstate,
                       billingcountry,BillingPostalCode,phone,Compsure_Record_ID__c,Fax,industry,Total_Employees__c,Heard_From__c,
                       States_of_Operation__c,Login_Email__c,Password__c,Current_Annual_WC_Premium_Over_35_000__c 
                       from Account 
                       where id=:accId];
        //string[] statesofoperations =acc.States_of_Operation__c.split(';');
        Contact con = [select id,firstname,lastname,title,email 
                       from Contact
                       where accountid=:accId];
        system.debug('Account Name is==>'+acc);
        system.debug('Contact LastName is===>'+con.lastname);
        
        String msg;
        ErrorMessageHandler errorHandler;
        
        String errorMsg = validation(acc);
        if(string.isNotBlank(errorMsg)){       
            
            errorMsg = errorMsg+' fields are missing..!';
            errorHandler = new ErrorMessageHandler(false,errorMsg);
            return errorHandler;
        }
        system.debug('Account Id'+accid);
        
        //send Data into Compsure       
        
        Http p1 = new Http();
        HttpRequest request1 = new HttpRequest();
        
        if(acc.Compsure_Record_ID__c ==null){
            request1.setEndpoint('http://mrvdairy.etisbew.us/rest/restdevService/businessregistration/');
            request1.setMethod('PUT');
            string body ='{"recordID":"'+acc.id+'","recordOwner":"'+acc.Owner.name+'","BusinessName":"'+acc.name+'","firstName":"'+con.firstName+'","lastName":"'+con.lastName+'","Title":"'+con.title+'","Address":"'+acc.BillingStreet+'","City":"'+acc.BillingCity+'","State":"'+acc.BillingState+'","Country":"'+acc.BillingCountry+'","Zip":"'+acc.BillingPostalCode+'","Phone":"'+acc.phone+'","Fax":"'+acc.Fax+'","Email":"'+con.email+'","RegisterDate":"'+acc.Register_Date__c+'","TypeofBusiness":"'+acc.industry+'","TotalEmployees":"'+acc.Total_Employees__c+'","HeardFrom":"'+acc.Heard_From__c+'","StatesofOperation":"'+acc.selected_states__C+'","LoginName":"'+acc.Login_Email__c+'","Password":"'+acc.Password__c+'","CWC":"'+acc.Current_Annual_WC_Premium_Over_35_000__c+'","authToken":"'+accessToken+'"}';
            system.debug('Body'+body);
            request1.setHeader('Content-Type','application/json');
            request1.setHeader('Accept','application/json');
            request1.setBody('{"recordID":"'+acc.id+'","recordOwner":"'+acc.Owner.name+'","BusinessName":"'+acc.name+'","firstName":"'+con.firstName+'","lastName":"'+con.lastName+'","Title":"'+con.title+'","Address":"'+acc.BillingStreet+'","City":"'+acc.BillingCity+'","State":"'+acc.BillingState+'","Country":"'+acc.BillingCountry+'","Zip":"'+acc.BillingPostalCode+'","Phone":"'+acc.phone+'","Fax":"'+acc.Fax+'","Email":"'+con.email+'","RegisterDate":"'+acc.Register_Date__c+'","TypeofBusiness":"'+acc.industry+'","TotalEmployees":"'+acc.Total_Employees__c+'","HeardFrom":"'+acc.Heard_From__c+'","StatesofOperation":"'+acc.selected_states__C+'","LoginName":"'+acc.Login_Email__c+'","Password":"'+acc.Password__c+'","CWC":"'+acc.Current_Annual_WC_Premium_Over_35_000__c+'","authToken":"'+accessToken+'"}');
            
            HttpResponse response1 = p1.send(request1);
            system.debug('Response1 is===>>>'+response1);
            result1 = response1.getBody();
            system.debug('Result1===>>>'+result1);
            system.JSONParser parser1 = JSON.createParser(response1.getBody());
            while(parser1.nextValue()!=null){
                if(parser1.getCurrentName()=='USERID'){
                    CompsureUSERID= parser1.getText();
                }
                else if(parser1.getCurrentName()=='MESSSAGE'){
                    Response_Message = parser1.getText();
                    system.debug('Message++++++'+Response_Message);
                }
            }
            
            acc.Compsure_Record_ID__c = CompsureUSERID;
            try{
                upsert acc;
                errorHandler = new ErrorMessageHandler(true,''+Response_Message);
                return errorHandler;
            }catch(Exception e){
                
                msg = 'Account did not update. Error has occured. due to '+e.getMessage();
                errorHandler = new ErrorMessageHandler(false,msg);
                return errorHandler;
            }    
            
        }
        //return null;
        
        else if(acc.Compsure_Record_ID__c !=null){
            request1.setEndpoint('http://mrvdairy.etisbew.us/rest/restdevService/businessregistration/'+acc.Compsure_Record_ID__c+'');
            request1.setMethod('POST');
            string body ='{"recordID":"'+acc.id+'","recordOwner":"'+acc.Owner.name+'","BusinessName":"'+acc.name+'","firstName":"'+con.firstName+'","lastName":"'+con.lastName+'","Title":"'+con.title+'","Address":"'+acc.BillingStreet+'","City":"'+acc.BillingCity+'","State":"'+acc.BillingState+'","Country":"'+acc.BillingCountry+'","Zip":"'+acc.BillingPostalCode+'","Phone":"'+acc.phone+'","Fax":"'+acc.Fax+'","Email":"'+con.email+'","RegisterDate":"'+acc.Register_Date__c+'","TypeofBusiness":"'+acc.industry+'","TotalEmployees":"'+acc.Total_Employees__c+'","HeardFrom":"'+acc.Heard_From__c+'","StatesofOperation":"'+acc.selected_states__C+'","LoginName":"'+acc.Login_Email__c+'","Password":"'+acc.Password__c+'","CWC":"'+acc.Current_Annual_WC_Premium_Over_35_000__c+'","authToken":"'+accessToken+'"}';
            system.debug('Body'+body);
            request1.setHeader('Content-Type','application/json');
            request1.setHeader('Accept','application/json');
            request1.setBody('{"recordID":"'+acc.id+'","recordOwner":"'+acc.Owner.name+'","BusinessName":"'+acc.name+'","firstName":"'+con.firstName+'","lastName":"'+con.lastName+'","Title":"'+con.title+'","Address":"'+acc.BillingStreet+'","City":"'+acc.BillingCity+'","State":"'+acc.BillingState+'","Country":"'+acc.BillingCountry+'","Zip":"'+acc.BillingPostalCode+'","Phone":"'+acc.phone+'","Fax":"'+acc.Fax+'","Email":"'+con.email+'","RegisterDate":"'+acc.Register_Date__c+'","TypeofBusiness":"'+acc.industry+'","TotalEmployees":"'+acc.Total_Employees__c+'","HeardFrom":"'+acc.Heard_From__c+'","StatesofOperation":"'+acc.selected_states__C+'","LoginName":"'+acc.Login_Email__c+'","Password":"'+acc.Password__c+'","CWC":"'+acc.Current_Annual_WC_Premium_Over_35_000__c+'","authToken":"'+accessToken+'"}');
            
            HttpResponse response1 = p1.send(request1);
            system.debug('Response1 is===>>>'+response1);
            result1 = response1.getBody();
            system.debug('Result1===>>>'+result1);
            system.JSONParser parser1 = JSON.createParser(response1.getBody());
            while(parser1.nextValue()!=null){
                if(parser1.getCurrentName()=='MESSSAGE'){
                    Response_Message = parser1.getText();
                    system.debug('Message++++++'+Response_Message);
                }
            }
            
            errorHandler = new ErrorMessageHandler(true,''+Response_Message);
            return errorHandler;
        }
        return null;
        
    }
    public class ErrorMessageHandler{
        
        @AuraEnabled
        public Boolean isSuccess { get; set; }
        
        @AuraEnabled
        public String message { get; set; }
        
        public ErrorMessageHandler(Boolean isSuccess,String msg){
            this.isSuccess = isSuccess;
            this.message = msg;
        }
    }
    public static String validation(Account acc){
        string msg = '';
        
        if(acc.Login_Email__c == null) {
            msg = msg+' Login Email, ';
        }
        if(acc.Password__c == null){
            msg = msg+' Password, ';
        }
        if(acc.Current_Annual_WC_Premium_Over_35_000__c ==null) {
            msg = msg+' Current Annual WC Premium Over 35,000, ';
        }
        
        if(acc.States_of_Operation__c==null) {
            msg = msg+' States of Operation, ';
            
            
        }
        if(acc.Heard_From__c == null) {
            msg = msg+' Heard From, ';
        }
        if(acc.Total_Employees__c == null) {
            msg = msg+' Total Employees, ';
        }
        if(acc.Billingstreet == null ||  acc.Billingcountry == null|| acc.Billingcity == null ||acc.Billingstate == null || acc.BillingPostalCode == null) {
            //msg = msg+'Oops, some key values are missing..' + '\n' + '!Please ensure following fields are not left blank:' ;
            msg = msg+' Address ';
        }
        /*   if(acc.BillingPostalCode == null) {
//msg = msg+'Oops, some key values are missing..' + '\n' + '!Please ensure following fields are not left blank:' ;
msg = msg+' Address ';
}*/
        return msg;
    }
}