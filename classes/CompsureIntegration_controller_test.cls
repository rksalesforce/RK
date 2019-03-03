@isTest
public class CompsureIntegration_controller_test{
 
     Static testmethod void InsertAccounttest1(){
        Account acc = new Account(name = 'test11',industry='banking',Register_Date__c='03/05/1990');
        insert acc;
        
        CompsureIntegration_controller.validation(acc);
        CompsureIntegration_controller.ErrorMessageHandler error = new CompsureIntegration_controller.ErrorMessageHandler(true, 'test');
        error.isSuccess = true;
        error.message = 'test';
        
    }
    Static testmethod void InsertAccounttest2(){
         Account acc = new Account(
            name = 'test',
            Billingstreet='test',
            Billingstate='test',
            Billingcountry='test',
            Billingcity='test',
            BillingPostalCode='56565',
            industry='banking',
            Register_Date__c='03/05/1990',
            Total_Employees__C='1-49',
            Current_Annual_WC_Premium_Over_35_000__c='Yes',
            Heard_From__c='colleague',
            States_of_Operation__c='Alaska',
            Phone='77777227',
            Login_Email__c='tsest11',
            Password__c='24524'
        );
        insert acc;
        system.debug('@@@@'+acc);
        Contact con = new contact(
            firstName = 'test',
            lastname='test',
            Title='test',
            Email='test111@test.com',
            accountid=acc.id
        );    
        insert con;
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('insertacc1');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.startTest();
        
        Test.setMock(HttpCalloutMock.class, mock);
       CompsureIntegration_controller.ErrorMessageHandler response = CompsureIntegration_controller.InsertAccount(acc.id);
        Test.stopTest();
}
Static testmethod void InsertAccounttest3(){
         Account acc = new Account(
            name = 'test',
            Billingstreet='test',
            Billingstate='test',
            Billingcountry='test',
            Billingcity='test',
            BillingPostalCode='56565',
            industry='banking',
            Register_Date__c='03/05/1990',
            Total_Employees__C='1-49',
            Current_Annual_WC_Premium_Over_35_000__c='Yes',
            Heard_From__c='colleague',
            States_of_Operation__c='Alaska',
            Compsure_Record_ID__c='11234',
            Phone='77777227',
            Login_Email__c='tsest11',
            Password__c='24524'
        );
        insert acc;
        system.debug('@@@@'+acc);
        Contact con = new contact(
            firstName = 'test',
            lastname='test',
            Title='test',
            Email='test111@test.com',
            accountid=acc.id
        );    
        insert con;
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('insertacc1');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.startTest();
        
        Test.setMock(HttpCalloutMock.class, mock);
       CompsureIntegration_controller.ErrorMessageHandler response = CompsureIntegration_controller.InsertAccount(acc.id);
        Test.stopTest();
}
}