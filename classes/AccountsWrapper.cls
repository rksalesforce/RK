public class AccountsWrapper {
public List<WrapAccount> WrapAccountList{get;set;}
public List<Account> selectedAccounts{get;set;}
public AccountsWrapper (){
    if(WrapAccountList == null){
        WrapAccountList =new List<WrapAccount>();
        List<Account> acc = [select id,name,billingstate,website,phone from Account where phone!=null];
        for(Account a :acc){
            WrapAccountList.Add(new WrapAccount(a));
        }
    }
}

public void selectedAccounts(){
    selectedAccounts = new List<Account>();
    for(WrapAccount w :WrapAccountList){
        if(w.selected==true){
            selectedAccounts.Add(w.acc);
        }
    }
}

public class WrapAccount{
    public Account acc{get;set;}
    public boolean selected{get;set;}
    
    public WrapAccount(Account a){
        acc = a;
        selected = false;
    }
}
}