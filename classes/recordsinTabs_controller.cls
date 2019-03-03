public class recordsinTabs_controller {
    public string selectedValue{get;set;}
    public List<Account> accList{get;set;}
    public List<Contact> conList{get;set;}
    public List<Opportunity> oppList{get;set;}
    public List<Object> lst {get;set;}
    public void show(){
        system.debug('SSSSSS===== ::: '+selectedValue);
        if(selectedValue == ''){
         
        }
        
        else if(selectedValue == 'ALL'){
            lst = [select id,name,(select lastname from Contacts),(select StageName from Opportunities) from Account];
            system.debug('All List ==:: '+lst);
        }
        else if(selectedValue == 'acc'){
            lst = [select id,name from Account];
            system.debug('Account List ==:: '+lst);
        }
        else if(selectedValue == 'con'){
            lst= [select id,lastName from Contact];
            
            system.debug('Contact List ==:: '+lst);
        }
        else if(selectedValue == 'opp'){
            lst= [select name from Opportunity];
            
            system.debug('Opportunity List ==:: '+lst);
        }
    }
}