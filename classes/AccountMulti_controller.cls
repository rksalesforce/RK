public class AccountMulti_controller {

    public string selectedmarketprovider{get;set;}
    public List<Selectoption> lstoptions{get;set;}
    public AccountMulti_controller(ApexPages.StandardController controller) {
       
    }
public void getAccounts(){
        lstOptions = new List<Selectoption>();
        List<Account>  lstmarketproviders = [select id,Name from Account];
        system.debug('lstmarketproviders '+lstmarketproviders );
          for(Account mp :lstmarketproviders ){
                lstoptions.Add(new selectOption(mp.Name ,mp.Name));
           
        }
        
    }
}