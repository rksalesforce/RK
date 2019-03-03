public class AccountDuplicateCheck {
public Account acc{get;set;}

public AccountDuplicateCheck(){
    acc = new Account();
}

public void Save(){
     integer recordCount = [Select count() from Account Where name =:acc.Name];   
     
     if(recordCount>0){
         Apexpages.AddMessage(New ApexPages.Message(ApexPages.Severity.warning,'Account Name Already Exist.'));
     }
     else{
         insert acc;
         ApexPages.AddMessage(New ApexPages.Message(ApexPages.severity.Confirm,'Account Created Succesfully.'));
     }
}
}