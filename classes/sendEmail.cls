public class sendEmail {

public string subject{get;set;}
public string body{get;set;}
public blob attbody{get;set;}
public string attname{get;set;}
public string sendTo{get;set;}
public List<document> docList{get;set;}
private final Account account{get;set;}

//Constructor that populate Account object

public SendEmail(){
    docList = new List<Document>();
    emailTemplate ev =[select id,name,subject,body from EmailTemplate where name ='test Template'];
    subject =ev.subject;
    body = ev.body;
     
}

public pagereference send(){
    Messaging.SingleEmailMessage email= new Messaging.SingleEmailMessage();
    
    //take the pdf content
    emailTemplate ev = [select id,name,subject,body from EmailTemplate where name = 'test template'];
    string [] toAddresses = sendTo.split(';' , 0);
    
    //select parameter of the email
    email.setSubject(subject);
    email.setToAddresses(toAddresses);
    email.setPlainTextBody(body);
    //create the email attachment
    Messaging.EmailFileAttachment efa = new Messaging.emailFileAttachment();
    efa.setFileName(attname);
    efa.setBody(attbody);
    email.setFileAttachments(new Messaging.EmailFileAttachment[]{efa});
    
    //Send the email
    
    Messaging.sendEmailResult[] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email}); 
     
    return null;
    }
   
    public string docName{get;set;}
    
    public pageReference uploadPdf(){
        Document d = new Document();
        d.folderId = userInfo.getUserId();
        d.name = this.attname;
        d.body = this.attbody;
        
        try{
            insert d;
            docList.Add(d);
            docName = d.name;
            send();
        } 
        catch(exception e){
            system.debug('Error:'+ e);
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.severity.info,'e-'+e));
        }
        finally{
            attbody = null;
            d = new Document();
            
        }   
        return Null; 
        
    }
}