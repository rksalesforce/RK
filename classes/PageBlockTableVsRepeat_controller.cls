public class PageBlockTableVsRepeat_controller {
public list<Account> lstAccount{get;set;}

public void getContacts(){
    lstAccount = [select Name,phone,industry from Account  where industry !=Null limit 4];
}
}