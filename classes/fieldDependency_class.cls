public class fieldDependency_class{
   public Opportunity opp{get;set;}
   public fieldDependency_class(){
       opp = new Opportunity();
   }
   public void save(){
       insert opp;
   }
}