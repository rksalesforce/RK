@isTest
public class AccountDuplicateCheck_test {

    static testmethod void Test_Save(){
    	Account acc = new Account(name ='test' );
        insert acc;
        integer recordCount = [Select count() from Account Where name =:acc.Name];
        
        AccountDuplicateCheck ad = new AccountDuplicateCheck(); 
            ad.save();
    }
    
}