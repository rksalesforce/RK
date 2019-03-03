public class EmployeeDetails_Controller {
public Employee__C emp{get;set;}
public string searchText{get;set;}

public void empDetails(){
if(searchText != null && searchText != '')
        {
            searchText += '%'; 
 emp = [select id,Name,Employee_Photo__c,Phone__C,floor__C,Tower__C,Company_Name__c ,Company_logo__C,AUTHORIZED_SIGNATORY__c,Blood_group__c,Date_of_Issue__c,Emergency_No__c,Employee_Code__c,SEZ_AUTHORIZED_OFFICER__c,SEZ_Serial_No__c,Valid_Upto__c from Employee__C where Name Like : searchText]   ;
 }
}
}