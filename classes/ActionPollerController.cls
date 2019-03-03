public class ActionPollerController {
public List<Account> accList{get;set;}

public void accs(){
    accList = [select name,industry from Account where createddate = today];
}
}