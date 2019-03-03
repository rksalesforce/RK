trigger ContactAssociatedToAccount on Contact (before insert , before update) {
if((trigger.isInsert||trigger.isupdate) && trigger.isBefore){
   for(Contact con :trigger.new){
      if( con.accountId == null ){
          con.addError('Contact must be attached to an account.');
      }
   }
   }
}