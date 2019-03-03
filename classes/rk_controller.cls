public class rk_controller {
public List<Account> lstAccounts{get;set;}

public void show(){
    lstAccounts = [select id,name,industry,phone from Account where industry!=null AND phone!=null];
}
    
}