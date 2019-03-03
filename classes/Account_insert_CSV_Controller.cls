public class Account_insert_CSV_Controller {
 
 public blob csvFileBody {get;set;}
 public string csvAsString {get;set;}
 public string[] csvFileLines {get;set;}
 public list<Account> accList {get;set;}
    
    public Account_insert_CSV_Controller (){
        csvFileLines = new string[]{};
        accList = new list<Account>();
    }
    
    public void importCsvFile(){
       
        try{
        csvAsString = csvFileBody.toString();
        csvFileLines = csvAsString.split('\n');
            for(Integer i=0;i<csvFileLines.size(); i++){
            Account a = new Account();
            string[] csvRecordData = csvFileLines[i].split(',');
            a.Name = csvRecordData[0];
           
            accList.add(a);
        }
        //insert accList;
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importin data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
    }
}