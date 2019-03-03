@RestResource(URLMapping='/RestAccount2d/*')
global class RestAccount2d {
@HttpGet
    global static List<Account> show(){
        List<Account> accList = new List<Account>();
        accList = [select id,name from Account];
        return accList;
    }
@HttpPost
    Global Static Account AccountInsert(string name,string rating,string accid,string lastname){
        Account acc = new Account();
        acc.name = name;
        acc.Rating = rating;
        acc.account_Id__C = accid;
        insert acc;
        contact con = new Contact();
        con.lastname = acc.name;
        con.accountid = acc.id;
        insert con;
        return acc;
    }
@HttpPATCH
    global static void updateAccount(string name , string rating){
    
        RestRequest request = RestContext.request;
        String accountname = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Account ac = [select id,name,accountnumber,rating,account_Id__C from Account where name=:accountname];
        ac.name = name;
        ac.rating = rating;
        
        update ac;
    }
    
@HttpDelete
    global static void deleteAccount(){
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        String accountName = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        system.debug('@@@@'+accountName);
        Account ac = [select id,name from Account where name=:accountName];
        delete ac;
    }
}