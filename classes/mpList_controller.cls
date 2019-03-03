public class mpList_controller {
public List<Selectoption> lstoptions{get;set;}
public static string Selectedmarketprovider{get;set;}
public static id oppid;
    public mpList_controller(ApexPages.StandardController controller) {
       
    }
    
    
public void getmarketproviders(){
        lstOptions = new List<Selectoption>();
        List<Contact>  lstmarketproviders = [select id,Name from Contact order by Name];
        //lstOptions.Add(new SelectOption('','===None==='));
        if(!lstmarketproviders.isEmpty()){
            for(Contact mp :lstmarketproviders ){
                lstoptions.Add(new selectOption(mp.Name,mp.Name));
            }
        }
      
}

public static void Show(){
system.debug('SELECTED ==== ::: '+Selectedmarketprovider);
    oppid = ApexPages.CurrentPage().getParameters().get('id');
    Opportunity opp = [select id,Selected_Market_Providers__c from Opportunity where id=:oppid];
    opp.Selected_Market_Providers__c= Selectedmarketprovider;
      update opp;
}
}