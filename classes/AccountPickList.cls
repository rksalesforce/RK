public class AccountPickList {
public List<Selectoption> lstoptions{get;set;}
public string SelectedAccount{get;set;}

public void getAllAccounts(){
    lstOptions = new List<Selectoption>();
    List<Account> accList = [Select id,Name from Account];
    lstOptions.Add(new SelectOption('','===None==='));
    if(!accList.isEmpty()){
        for(Account a :accList){
            lstoptions.Add(new selectOption(a.id,a.Name));
        }
    }
    
}

public void Show(){

}
}