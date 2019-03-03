@isTest
public class AccountRelatedContacts_test {
    static testmethod void allAccounts_test(){
        Account acc= new Account(name='test');
        insert acc;
        Contact con = new Contact(lastname = 'test',accountid = acc.id);
        insert con;
        AccountRelatedContacts ac = new AccountRelatedContacts();
        ac.allaccounts();
        ac.relatedContacts();
    }
}