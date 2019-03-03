trigger restRequirement on Contact (after insert) {
    set<id> Ids = new set<id>();
    for(Contact c : trigger.new){
        ids.Add(c.id);
        Util.callWebservice(Ids);
    }
   
    public ID documentId {get;set;}
    public string email;
   
    document lstDoc= [select id, name, body, contenttype, developername, type from Document where name ='gotomeeting.txt'];
    document lstDoc1= [select id, name, body, contenttype, developername, type from Document where name ='Client Services Agreement'];
    document lstDoc2= [select id, name, body, contenttype, developername, type from Document where name ='3rd review document.docx'];
    
    for(Contact con : trigger.new){
        
        email = con.email;    

        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();    
        Messaging.EmailFileAttachment attach1 = new Messaging.EmailFileAttachment();    
        Messaging.EmailFileAttachment attach2 = new Messaging.EmailFileAttachment();    
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        attach .setFileName(lstDoc.Name);
        attach1.setfileName(lstDoc1.Name);
        attach2.setfileName(lstDoc2.Name);
        
        attach .setBody(lstDoc.Body);
        attach1 .setBody(lstDoc1.Body);
        attach2 .setBody(lstDoc2.Body);
        
        attach .setContentType(lstDoc.ContentType);
        attach1 .setContentType(lstDoc1.ContentType);
        attach2 .setContentType(lstDoc2.ContentType);

        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach,attach1,attach2 }); 

        mail.setUseSignature(false);
        mail.setToAddresses(new String[] { email });
        mail.setSubject('Document Email Demo'+con.Name);
        mail.setHtmlBody('Here is the email you requested: '+lstdoc.name);            
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });   
        
    }
    
}