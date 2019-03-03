@RestResource(URLMapping='/SantoshAccountRecords')
global class SantoshAccounts {
@HttpGet
    global static List<Account> sAccounts(){
        List<Account> lstAcc = [select id,name,rating from Account];
    	return lstAcc;
    }
}