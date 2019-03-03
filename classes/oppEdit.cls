public class oppEdit {
public opportunity opp{get;set;}
public string eid{get;set;}

public oppEdit(){
    eid = ApexPages.CurrentPage().getParameters().get('id');
    opp = [select id,name from opportunity where id=:eid];
}
public pageReference doUpdate(){
    update opp;
    pageReference pgRef = new PageReference('/apex/ContactEdit');
    pgRef.setRedirect(true);
    return pgRef;
}
}