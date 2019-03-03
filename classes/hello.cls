public class hello {
public contact primaryCon{get;set;}
public Account acc{get;set;}
public contact otherCon{get;set;}
public List<Contact> childsList{get;set;}
public List<Contact> childsList1{get;set;}
public Contact childCon{get;set;}

public hello(){
    primaryCon = new Contact();
    acc = new Account();
    otherCon = new Contact();
    childsList = new List<Contact>();
    childsList1 = new List<Contact>();
    childCon = new Contact();
    childsList.Add(childCon);
}

public void AddRow(){
    childCon = new Contact();
    childsList.Add(childCon);
}

public void save(){
    insert PrimaryCon;
    acc.name = primaryCon.lastname;
    insert acc;
    primaryCon.accountId = acc.id;
    insert OtherCon;
    otherCon.accountId = acc.id;
    update primaryCon;
    update OtherCon;
  //  childsList.Add(childCon);
  for(Contact cc :childsList){
      cc.accountId = acc.id;
      childsList1.Add(cc);
  }
    insert childsList1;
}
}