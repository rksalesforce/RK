public class VendorUpload_Controller {
public Blob csvFileBody{get;set;}
public string csvAsString{get;set;}
public String[] csvFileLines{get;set;}
public List<Vendor__c> emplist{get;set;}

  public VendorUpload_Controller (){
    csvFileLines = new String[]{};
    emplist = New List<Vendor__c>(); 
  }
  
  public void importCSVFile(){
       try{
           csvAsString = csvFileBody.toString();
           csvFileLines = csvAsString.split('\n'); 
            
           for(Integer i=1;i<csvFileLines.size();i++){
               Vendor__c empObj = new Vendor__c() ;
               string[] csvRecordData = csvFileLines[i].split(',');
               empobj.Name = csvRecordData[0] ;             
             
               //empobj.Photo__C = csvRecordData[1];                                                                         
               emplist.add(empobj);   
           }
        insert emplist;
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importin data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
  }

}