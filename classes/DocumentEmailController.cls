public with sharing class DocumentEmailController {

  public ID documentId {get;set;}
  public String email {get;set;}

  public PageReference sendDoc() {
 
    List<Document> lstDoc = new List<Document>();
    lstDoc= [select id, name, body, contenttype, developername, type from Document Limit 3];
    Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
    for (Integer i = 0; i < lstDoc.size(); i++){
                    attach.setFileName(lstDoc[i].Name);
                    attach.setBody(lstDoc[i].Body);
                    attach.setContentType(lstDoc[i].ContentType);
                }
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

    for(Document doc :lstdoc){
    attach.setContentType(doc.contentType);
    attach.setFileName(doc.developerName+'.'+doc.type);
    attach.setInline(false);
    attach.Body = doc.Body;
    system.debug('%%%%%'+attach);
    
    mail.setUseSignature(false);
    mail.setToAddresses(new String[] { email });
    mail.setSubject('Document Email Demo');
    mail.setHtmlBody('Here is the email you requested: '+doc.name);
    }
    mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
    
    // Send the email
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    
    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Email with Document sent to '+email));

    return null;

  }

}