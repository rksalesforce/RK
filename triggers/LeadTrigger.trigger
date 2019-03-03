trigger LeadTrigger on Lead (before insert,before update) {
if((trigger.isInsert||trigger.isUpdate)&& trigger.isBefore){
    for(Lead ld : trigger.new){
        if(ld.Email == null || ld.Email ==''){
            ld.Email.AddError('email field Cannot be empty.');
        }
        else if(ld.Phone==Null || ld.Phone == ''){
            ld.Phone.AddError('Phone field Cannot be empty.');
        }
    }
}

}