public class contactquery{
    public List<Account> accList{get; set;}
   
    public contactquery()
    {
    accList = new List<Account>();
       for (Account a : [Select id, Name,rating,accountnumber,industry,type from Account])
       {       
           accList.add(a);
       }
    }
}