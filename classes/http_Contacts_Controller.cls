public class http_Contacts_Controller {

public http_Contacts_Controller (){
    
    Set<String> setContactIds = new set<String>();
    
    for(Contact ObjC : [select id,LastName,Cid__C,Gender__C,mailingStreet,mobilePhone from Contact Where cId__C !=Null Limit 50000]){
        setContactIds.Add(objC.Cid__C);
    }
    //http Request Class
    HTTPRequest requestParam = new HTTPRequest();
    requestParam.setEndpoint(label.ContactsEndPointURL);
    requestParam.setMethod('GET');
   
    //HTTP Response Class
    HTTP httpParam = new HTTP();
    HTTPResponse response = httpParam.send(requestParam);
    string strResponse = response.getBody();
    system.debug('Service Responce is====>>>'+ strResponse);
   
    //Json Parsing
    
    JsonParser parser1 = Json.CreateParser(strResponse);
    List<String> ContactIds = new List<String>();
     while (parser1.nextToken() != null) {
         //Get the list of Contact Ids
            if ((parser1.getCurrentToken() == JSONToken.FIELD_NAME) && (parser1.getText() == 'id')) {
                // Get the value.
                parser1.nextToken();
                // Compute the List of Ids from the response.
               ContactIDs.Add(parser1.getText());
            }
        }
    
    JsonParser parser2 = Json.CreateParser(strResponse);
    List<String> ContactNames = new List<String>();
     while (parser2.nextToken() != null) {
         //Get the list of Contact Names
            if ((parser2.getCurrentToken() == JSONToken.FIELD_NAME) && (parser2.getText() == 'name')) {
                // Get the value.
                parser2.nextToken();
                // Compute the List of Names from the response.
               ContactNames.Add(parser2.getText());
            }
        }
    
    JsonParser parser3 = Json.CreateParser(strResponse);
    List<String> addresses = new List<String>();
     while (parser3.nextToken() != null) {
         //Get the list of Contact Addresses
            if ((parser3.getCurrentToken() == JSONToken.FIELD_NAME) && (parser3.getText() == 'address')) {
                // Get the value.
                parser3.nextToken();
                // Compute the List of Addresses from the response.
               addresses.Add(parser3.getText());
            }
        }
    
    JsonParser parser4 = Json.CreateParser(strResponse);
     List<String> emails = new List<String>();
     while (parser4.nextToken() != null) {
         //Get the list of Contact emails
            if ((parser4.getCurrentToken() == JSONToken.FIELD_NAME) && (parser4.getText() == 'email')) {
                // Get the value.
                parser4.nextToken();
                // Compute the List of emails from the response.
               emails.Add(parser4.getText());
            }
        }
    
    JsonParser parser5 = Json.CreateParser(strResponse);
     List<String> genders = new List<String>();
     while (parser5.nextToken() != null) {
         //Get the list of Contact Gender
            if ((parser5.getCurrentToken() == JSONToken.FIELD_NAME) && (parser5.getText() == 'gender')) {
                // Get the value.
                parser5.nextToken();
                // Compute the List of Gender from the response.
               genders.Add(parser5.getText());
            }
        }
    
    JsonParser parser6 = Json.CreateParser(strResponse);
     List<String> Mobiles = new List<String>();
     while (parser6.nextToken() != null) {
         //Get the list of Contact Mobiles
            if ((parser6.getCurrentToken() == JSONToken.FIELD_NAME) && (parser6.getText() == 'mobile')) {
                // Get the value.
                parser6.nextToken();
                // Compute the List of Mobiles from the response.
               mobiles.Add(parser6.getText());
            }
        }
    
    lstWI = new List<WrapContacts>();
    for(integer i=0;i<contactIds.size();i++){
        objWi =new WrapContacts();
        objWi.id = contactIds[i];
        objWi.Name = contactNames[i];
        objWi.address = addresses[i];
        objWi.gender = genders[i];
        objWi.email = emails[i];
        objWi.mobile = mobiles[i];
        objWi.Ischecked = false;
        if(!setContactIds.contains(ObjWi.id)){
        lstWi.add(ObjWi);
        }
     
    }
}

public pageReference doSave(){
List<Contact> lstC = new List<Contact>();
    for(WrapContacts objWi : lstWi){
     
         if(objWI.isChecked == true){
            Contact objC = new Contact();
            objC.lastName = objWi.Name;
            objC.CId__C = objWI.id;
            objc.email = objWi.email;
            objc.gender__C = objWi.gender;
            objc.mobilePhone = objWi.mobile;
            objc.mailingStreet = objWi.address;
           
            lstC.Add(objC);
            }
    }
     if(lstC.size()>0){
         insert lstC;
           }
   
    return (new pageReference('/apex/HtppVF').setRedirect(true));
}
   
    public WrapContacts objWI{get;set;}
    public List<WrapContacts> lstWI{get;set;}
    
    public class WrapContacts{
        
        public boolean isChecked{get;set;}
        public string id{get;set;}
        public string Name{get;set;}
        public string Address{get;set;}
        public string gender{get;set;}
        public string email{get;set;}
        public string mobile{get;set;}
        
        
    }
    
    
}