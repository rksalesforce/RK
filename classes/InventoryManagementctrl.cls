public without sharing class InventoryManagementctrl{
    
    public boolean ShowOpportunityView{get;set;}
    public boolean ShowInventoryView{get;set;}
    public boolean ShowReportView{get;set;}
    public list<Opportunity> oppList{get;set;}
    public list<Contact> lstInventory{get;set;}
    public list<selectoption> lstView{get;set;}
    public string SelectedView{get;set;}
    public Integer noOfRecords{get; set;}
    public Integer size{get;set;}
    public string ViewType{get;set;}
    public string queryString {get;set;}
    //filters
    Public string OptyName {get;set;}
    public string Allocation_Status {get;set;}
    public string Community_Type {get;set;}
    public string Standard {get;set;}
    public string Technology {get;set;}
    public string Prospecting_Year {get;set;}
    public string Vintage{get;set;}
    Public string Location{get;set;}
    //filters
    Public void ResetFilters(){
        Location='';Allocation_Status ='';Community_Type ='';Allocation_Status ='';Standard ='';Technology ='';Prospecting_Year ='';Vintage='';
    }
    
    Public void ApplyFilters(){
        oppList.clear();
        setCon = null;
        queryString = 'Select Id,Name,Estimated_Annual_Amount__c,CloseDate,Account.Name,StageName,TotalOpportunityQuantity,Price__c,Facility_Name__c,State__c from Opportunity Where id!=Null';
        if(SelectedView=='Opportunity'){
            //queryString += ' where StageName=\'Closed Won\' limit 1000';
            GetOpportunities();
        }else if(SelectedView=='Inventory'){
            GetInventories();
        }else{
            GetReports();
        }
    }
    public InventoryManagementctrl(ApexPages.StandardController controller) {
        lstView = new list<selectoption>();
        SelectedView = 'Opportunity';
        ViewType = 'Opportunities';
        lstView.add(new selectoption('--None--','--None--'));
        lstView.add(new selectoption('Opportunity','Opportunity'));
        lstView.add(new selectoption('Inventory','Inventory'));
        queryString = '';
        oppList = new list<Opportunity>();
    }
    public void ChangeView(){
        oppList.clear();
        setCon = null;
        queryString = 'Select Id,Name,Estimated_Annual_Amount__c,CloseDate,Account.Name,StageName,TotalOpportunityQuantity,Price__c,Facility_Name__c,State__c from Opportunity Where id!=Null LIMIT 2000';
        if(SelectedView=='Opportunity'){
            //queryString += ' where StageName=\'Closed Won\' limit 1000';
            GetOpportunities();
        }else if(SelectedView=='Inventory'){
            GetInventories();
        }else{
            GetReports();
        }
    }
    Public Void SearchByName(){
        oppList.clear();
        setCon = null;
        queryString = 'Select Id,Name,Estimated_Annual_Amount__c,CloseDate,Account.Name,StageName,TotalOpportunityQuantity,Price__c,Facility_Name__c,State__c from Opportunity Where Name =: optyName';
        //id!=Null AND
        if(SelectedView=='Opportunity'){
            //queryString += ' where StageName=\'Closed Won\' limit 1000';
            GetOpportunities();
        }else if(SelectedView=='Inventory'){
            GetInventories();
        }else{
            GetReports();
        }
        /*for(Opportunity opp:(List<Opportunity>)setCon.getRecords()){
            oppList.add(opp);
        }
        return oppList;*/
    }
    public List<Opportunity> getOpportunities(){
        ViewType = 'Opportunities';
        ShowOpportunityView = true;
        ShowInventoryView = false;
        ShowReportView = false;
        if(OptyName!=Null&&OptyName!=''){
            queryString =  queryString+' AND Name like \'%'+String.escapeSingleQuotes(OptyName)+'%\'';
        }
        if(Location!=Null&&Location!=''){
            queryString =  queryString+' AND Client_Project_Location__c like \'%'+String.escapeSingleQuotes(Location)+'%\'';
        }
        if(Allocation_Status!=Null&&Allocation_Status!=''){
            queryString =  queryString+' AND Job_Status__c like \'%'+String.escapeSingleQuotes(Allocation_Status)+'%\'';
        }
        /*if(Community_Type!=Null){
            queryString =  queryString+' AND Job_Status__c like \'%'+String.escapeSingleQuotes(Community_Type)+'%\'';
        }
        if(Standard!=Null){
            queryString =  queryString+' AND Job_Status__c like \'%'+String.escapeSingleQuotes(Standard)+'%\'';
        }
        if(Technology!=Null){
            queryString =  queryString+' AND Job_Status__c like \'%'+String.escapeSingleQuotes(Technology)+'%\'';
        }
        if(Prospecting_Year!=Null){
            queryString =  queryString+' AND Job_Status__c like \'%'+String.escapeSingleQuotes(Prospecting_Year)+'%\'';
        }*/
        if(Vintage!=Null&&Vintage!=''){
            queryString =  queryString+' AND Vintage__c like \'%'+String.escapeSingleQuotes(Vintage)+'%\'';
        }
        lstInventory = new list<Contact>();
        for(Opportunity opp:(List<Opportunity>)setCon.getRecords()){
            oppList.add(opp);
        }
        return oppList;
    }
    public string OpportunityId{get;set;}
    public string OpportunityName{get;set;}
    public list<OpportunityLineItem> lstOLI{get;set;}
    public void GetOpporunityProducts(){
        if(ApexPages.currentPage().getParameters().get('oppId')!=null)
            OpportunityId = ApexPages.currentPage().getParameters().get('oppId');
        lstOLI = new list<OpportunityLineItem>();
        if(OpportunityId!=null){
            for(OpportunityLineItem OLI:[Select Id,Quantity,UnitPrice,TotalPrice,Description from OpportunityLineItem where OpportunityId=:OpportunityId]){
                                             lstOLI.add(OLI);
                                         }
        }
    }
    
    public void GetInventories(){
        ViewType = 'Inventories';
        ShowInventoryView = true;
        ShowOpportunityView = false;
        ShowReportView = false;
        lstInventory = new list<Contact>();
        oppList = new list<Opportunity>();
        for(Opportunity inv:[select Id,Name,CloseDate,Account.Name from  opportunity LIMIT 2000]){
            oppList.add(inv);
        }
    }
    
    public void GetReports(){
        ViewType = 'Reports';
        ShowInventoryView = false;
        ShowOpportunityView = false;
        ShowReportView = true;
        lstInventory = new list<Contact>();
        oppList = new list<Opportunity>();
    }
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                size = 10;
                //string queryString ; 
                System.debug('queryString '+queryString );
                //queryString = queryString+' AND StageName=\'Closed Won\' limit 1000';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
            }
            return setCon;
        }set;
    }
    public Integer getTotalPages() {
        return Integer.valueof(Math.ceil((Double) noOfRecords / size));
    }
    public pageReference refresh() {
        setCon = null;
        setCon.setPageNumber(1);
        return null;
    }
}