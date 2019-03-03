public class OpprtunityZone {
public contact con1{get;set;}
public contact con2{get;set;}
public contact child{get;set;}
public list<Contact> lstCon{get;set;}
public account acc{get;set;}
public OpprtunityZone (){
con1 = new Contact();
con2 = new Contact();
child = new Contact();
lstcon = new List<Contact>();
}

public void save(){
    insert con1;
    acc.name = con1.lastname;
    insert acc;
    con1.accountId = acc.id;
    update con1;
}

public void Addrow(){
    child = new Contact();
    lstcon.Add(child);
}
}