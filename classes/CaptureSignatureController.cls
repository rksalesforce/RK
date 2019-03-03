global with sharing class CaptureSignatureController {
global List<selectOption> lstOptions{get;set;}
global string SelectedAccount{get;set;} 

public CaptureSignatureController (){
    lstOptions = new List<SelectOption>();
    allAccounts();
    
   }
   
 public void allAccounts(){
    system.debug('Acc==========='+SelectedAccount);
  List<Account> accList = [Select id,Name from Account];
  lstOptions.Add(New SelectOption('','===None==='));
  if(!accList.isEmpty()){
      for(Account acc : accList){
          lstOptions.Add(New Selectoption(acc.id,acc.Name));
      }
  }
  
  }
 
 public static void Show(){
 
 }

 @RemoteAction
 global static String saveSignature(String imageUrl, String selectedAccount) {
     
  try {
      
   Attachment accSign = new Attachment();
  
   accSign.ParentID = selectedAccount;
 
   accSign.Body = EncodingUtil.base64Decode(imageUrl);
   accSign.contentType = 'image/png';
   accSign.Name = 'Signature Image';
   accSign.OwnerId = UserInfo.getUserId();
   insert accSign;
   
   return 'success';
   
  }catch(Exception e){
   system.debug('---------- ' + e.getMessage());
   return JSON.serialize(e.getMessage());
  }
  return null; 
 }

}