@RestResource(URLMapping = '/AccountIntegration/*')
global class ramakrishna {

@HttpGet
    global static List<Account> accountrecords(){
        List<Account> accList = [select id,name,accountNumber from Account];
        return accList;
    }
@HttpPost
Global static string accountInsert(string name,string accountnumber){
    Account acc = new Account();
    acc.name = name;
    acc.AccountNumber = accountnumber;
    insert acc;
    return acc.id;
}
}