trigger PreventDuplicateCandidates on Contact(before update) 
{
List<Contact> lstCon = new List<Contact>();
 lstCon = [select id,lastName from Contact];
 List<Contact> lstCon1 = new List<Contact>();
   for(Contact con :trigger.new){
       for(Contact cc : lstCon){
           if(cc.lastName == con.lastName){
               lstCon1.Add(con);
           }
       }
      
   }
  
}