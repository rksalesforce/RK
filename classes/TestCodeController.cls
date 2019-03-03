public with sharing class TestCodeController {

      public List<selectOption> getSelectOptions() { 
        List<selectOption> options = new List<selectOption>();
        options.add(new selectOption('--Select--','--Select--'));
        options.add(new SelectOption('Prospecting','Prospecting'));
        options.add(new SelectOption('Qualification','Qualification'));
        options.add(new SelectOption('Needs Analysis','Needs Analysis'));
        options.add(new SelectOption('Value Proposition','Value Proposition'));
        options.add(new SelectOption('Id. Decision Makers','Id. Decision Makers'));
        options.add(new SelectOption('Perception Analysis','Perception Analysis'));
        options.add(new SelectOption('Proposal/Price Quote','Proposal/Price Quote'));
        options.add(new SelectOption('Negotiation/Review','Negotiation/Review'));
        options.add(new SelectOption('Closed Won','Closed Won'));
        options.add(new SelectOption('Closed Lost','Closed Lost'));
       
        return options;
      }
    
      public String selectedVal{get;set;}
      public list<Opportunity> Opps{get;set;} 
      public TestCodeController()
      {
      }

      public pageReference oppList()
      {
      if(selectedVal !=null) 
      {
         Opps= [select name,type,CloseDate,stagename from Opportunity where StageName =: selectedVal];
      }
      return null;

      } 
  
}