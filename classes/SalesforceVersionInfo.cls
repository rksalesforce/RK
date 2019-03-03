global class SalesforceVersionInfo
{
    public List<SFInstance> sfInstances{get;set;}
    public List<Season__C> lst = new List<Season__C>();
    public SalesforceVersionInfo()
    {
        String jsonString = '[{\"label\":\"Winter \'11\",\"url\":\"/services/data/v20.0\",\"version\":\"20.0\"},{\"label\":\"Winter \'12\",\"url\":\"/services/data/v20.0\",\"version\":\"20.0\"},{\"label\":\"Spring \'11\",\"url\":\"/services/data/v21.0\",\"version\":\"21.0\"}]';
        sfInstances = (List<SFInstance>) System.JSON.deserialize(jsonString, List<SFInstance>.class);
        sfInstances.sort();
    }
   
    global class SFInstance implements Comparable
    {
        public String label{get;set;}
        public String url{get;set;}
        public string version{get;set;}
       
        public Integer compareTo(Object ObjToCompare)
        {
            return label.CompareTo(((SFInstance)ObjToCompare).label);
        }
    }
    
    public pageReference save(){
        for(sfInstance acc : sfInstances){
            Season__C se = new Season__C();
            se.Name = acc.label;
            se.Url__C = acc.url;
            se.version__C = acc.version;
            integer recordsCount = [ select count() from season__C where name =: se.Name];
             if(recordsCount == 0)
            {
            lst.add(se);
            }
        }
        
        insert lst;
        pageReference pgRef = new PageReference('/a0a/o');
        pgRef.setredirect(true);
        return pgRef;
    }
   
}