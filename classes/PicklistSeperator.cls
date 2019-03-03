public class PicklistSeperator {
    public static void PicklistSeperatorMethod(){
        list<test__c> Lst=new list<test__c>();
         Lst=[select id,states__c from test__c];
      map<id,list<string>>pp= new map<id,list<string>>();
     

        list<string>ss= new list<string>();
        for(test__c t:lst){
            if(t.states__c!=NULL){
            ss=t.states__c.split(';');
          pp.put(t.Id,ss);
          
            }
        }
        system.debug('====='+pp);
        
        
    }
}