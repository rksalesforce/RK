@restResource(urlMapping='/AccountsTest/*')
global class AccountsWeb{
    @HttpGet
    global static List<Account> accmethod(){
        List<Account> acclist = [select id,name,rating from Account limit 2];
        return accList;
    }
    @HttpPost
    global static id postAccount(string name,string accountnumber){
        Account acc = new Account();
        acc.name = name;
        acc.accountNumber = accountnumber;
        insert acc;
        return acc.id;
    }
    @HttpDelete
     global static String deleteOldCases() {
    String id = RestContext.request.params.get('id');
    Account company = [ Select ID, Name, BillingState from Account where id = :id];
    
    delete company;
    
    return 'Closed Cases Deleted';
    }
}