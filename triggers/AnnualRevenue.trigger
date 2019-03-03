trigger AnnualRevenue on Account (before insert,before Update,before delete) {

if((trigger.isInsert||trigger.isUpdate)&&trigger.isBefore){
    for(Account acc : trigger.new){
        if(acc.industry == 'Banking'){
            acc.AnnualRevenue = 500000;
        }
        else if(acc.industry == 'Finance'){
            acc.annualRevenue = 400000;
        }
        else if(acc.industry== 'Manufacturing'){
            acc.annualRevenue = 2500000;
        }
        else if(acc.industry == 'Healthcare'){
            acc.annualRevenue = 2000000;
        }
        else if(acc.industry == 'consulting'){
            acc.annualRevenue = 1000000;
        }
        else if(acc.industry == '' || acc.industry==NUll){
            acc.industry.AddError('Plese select Industry');
        }
        integer recordCount = [select count() from Account Where name =:acc.name];
        if(recordCount>0){
            acc.AddError('Dupilcate records are not allowed.');
        }
    }
}

if(trigger.isBefore && trigger.isDelete){
    for(Account acc: trigger.old){
        if(acc.Active__C == 'yes'){
        acc.AddError('An active Account cannot be deleted');
        }
    }
    List<Contact> lstContact = [select id,Name,accountId from contact where accountId IN :Trigger.oldMap.keySet()];
    if(!lstContact.isEmpty()){
        for(Contact con :lstContact){
            con.accountId= null;
        }
        update lstContact;
    }
}

}