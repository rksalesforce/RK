public class CustomlookupResultController {
    @AuraEnabled
    public static List < sObject > fetchLookUpValues(String searchKeyWord, String ObjectName) {
     
        String searchKey = searchKeyWord + '%';
        List < sObject > returnList = new List < sObject > ();
        string sQuery='select id,name from '+ObjectName+' where Name LIKE: searchKey order by createddate DESC limit 5';
        list<sobject> lstrecords=Database.query(sQuery);
        for(sobject so:lstrecords)
        {
            returnList.add(so);
        }
        return returnList;
    }
     @AuraEnabled
    Public static List<Opportunity> getOpportutnityStageValue(String accName){
        Account acc = [select id,name,(select id,createddate,name,StageName from opportunities where StageName='Closed Lost' ORDER BY LastModifiedDate DESC LIMIT 1) from account where name=:accName];
        system.debug(acc);
        system.debug(acc.Opportunities);
        List<Opportunity> o = new List<Opportunity>();
        o.addAll(acc.Opportunities);
        return o;
    }
}