public with sharing class Pagination_minnew {
    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    public boolean test = false;
    public ApexPages.StandardSetController setCon {
        get{
            if(setCon == null){
                if(test == false){
                size = 10;
                }
                string queryString = 'Select Name, Type, BillingCity, BillingState, BillingCountry from Account order by Createddate DESC';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(queryString));
                setCon.setPageSize(size);
                noOfRecords = setCon.getResultSize();
                test = true;
            }
            return setCon;
        }set;
    }
     
    Public List<Account> getAccounts(){
        List<Account> accList = new List<Account>();
        for(Account a : (List<Account>)setCon.getRecords())
            accList.add(a);
        return accList;
    }
     
    public pageReference refresh() {
        setCon = null;
        getAccounts();
        setCon.setPageNumber(1);
        return null;
    }
    public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('10','10'));
            options.add(new SelectOption('20','20'));
            options.add(new SelectOption('30','30'));
              options.add(new SelectOption('40','40'));
            return options;
        }
}