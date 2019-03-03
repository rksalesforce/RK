//Main Class
public class AccountRelatedContacts {
public List<SelectOption> lstOptions{get;set;}
public String selectedAccount{get;set;}
public List<Contact> lstContacts{get;set;}


public AccountRelatedContacts(){
    lstOptions =new List<SelectOption>();
}

public void allAccounts(){

    List<Account> lstAcc = [select id,Name from Account];
    lstOptions.Add(new SelectOption('','===None==='));
    if(!lstAcc.isEmpty()){
        for(Account acc:lstAcc){
        lstoptions.Add(new SelectOption(acc.id,acc.Name));
        }
    }
}

public void relatedContacts(){
   system.debug('Selected Account'+selectedAccount);
     lstContacts = [select id,Name from Contact where accountId =: selectedAccount];
}

}