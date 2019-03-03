public class PageNation {
  Public Integer size{get;set;} 
    Public Integer noOfRecords{get; set;} 
    public List<SelectOption> paginationSizeOptions{get;set;}
    public List<Opportunity> oppList {get;set;}     
    public list<selectoption> lstView{get;set;}
    public string selectedView{get;set;}
 
    public pageNation(){
               lstView = new list<selectoption>();
        lstView.add(new selectoption('','--None--'));
        lstView.add(new selectoption('Opportunity','Opportunity'));
        lstView.add(new selectoption('Inventory','Inventory'));     
 
    
    oppList = new List<Opportunity>();
        size=10;
        paginationSizeOptions = new List<SelectOption>();
        paginationSizeOptions.add(new SelectOption('5','5'));
        paginationSizeOptions.add(new SelectOption('10','10'));
        paginationSizeOptions.add(new SelectOption('20','20'));
        paginationSizeOptions.add(new SelectOption('50','50'));
        paginationSizeOptions.add(new SelectOption('100','100'));
    }
     
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null && selectedView == 'Opportunity'){          
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name,AccountId,Account.name,Amount,StageName,CloseDate,LastModifiedDate from Opportunity]));
                setCon.setPageSize(size);  
                noOfRecords = setCon.getResultSize();
            }
            
            else if(setCon == null && selectedView == 'Inventory'){   
                   
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name,AccountId,Account.name,Amount,StageName,CloseDate,LastModifiedDate from Opportunity LIMIT 1]));
                setCon.setPageSize(size);  
                noOfRecords = setCon.getResultSize();
            }
            
                        
            return setCon;
        }
        set;
    }
     
    //Changes the size of pagination
    public PageReference refreshPageSize() {
         setCon.setPageSize(size);
         return null;
    }
 
    // Initialize setCon and return a list of record    
     
    public void Opportunities() {
         oppList =  setCon.getRecords();
    }
}