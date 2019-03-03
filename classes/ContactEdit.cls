public class ContactEdit {
public string ecid{get;set;}
public List<opportunity> lstcon{get;set;}

public ContactEdit (){
    lstCon = [select id,name from opportunity];
}

public PageReference edit() {
    opportunity opp=[select id,name from opportunity where id=:ecid limit 1];
      
              pagereference ref = new pagereference('/apex/OppEdit?id='+ecid);
        ref.setRedirect(False);       
       return ref;   
    }
}