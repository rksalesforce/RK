public class accAcx {
    Public Account accounts {get;set;}

    public accAcx(ApexPages.StandardController controller) {
      accounts=(Account) controller.getRecord();      
    }

    public void changePickList(){
        if(accounts.CC__C= true){
            accounts.Rating= 'Hot';
        }
         else if(accounts.CC__C= False){
            accounts.Rating= 'Cold';
        }
    } 
}