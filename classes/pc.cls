public class pc {
 public List<Account> acct {get;set;}
    public pc()
    {
        acct = [SELECT Name,phone, (SELECT Name, Email FROM Contacts) FROM Account limit 20];
    }  
}