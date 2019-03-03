@isTest
public class CaptureSignatureController_test{
    static testmethod void savesignature_test(){
        List<Account> acclist = new List<Account>();
       for(integer i;i<10;i++){
            Account a = new Account();
            a.name = 'test'+i;
            
           accList.add(a);
       }
       insert accList;
       List<Attachment> atlist = new List<Attachment>();
       for(Account acc :accList){
      Attachment attach=new Attachment();       
        attach.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attach.body=bodyBlob;
        attach.parentId=acc.id;
        atList.add(attach);
        }
        insert atlist;
       
       CaptureSignatureController cs = new CaptureSignatureController();
       cs.AllAccounts();
       CaptureSignatureController.show();
       CaptureSignatureController.saveSignature('https:www.google.com','test');
 }       
}