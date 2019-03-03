@isTest
public class Account_insert_CSV_Controller_test {
    static testmethod void importCsvFile_test(){
         Account acc= new Account(name='test');
        insert acc;
        
        Account_insert_CSV_Controller aicc = new Account_insert_CSV_Controller();
        aicc.importCsvFile();
    }
}