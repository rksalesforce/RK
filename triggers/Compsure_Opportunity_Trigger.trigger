trigger Compsure_Opportunity_Trigger on Opportunity (before insert,before update,after update,after insert) {
    
 
    if((trigger.isinsert||trigger.isupdate)&&trigger.isbefore){
        for (Opportunity opp: Trigger.new){
            system.debug('****===>>>'+opp.name);
             
            if (opp.StageName.equalsIgnoreCase('Send email #1')){
                system.debug('@@@'+opp.name);
                if(opp.Expiration_Date__c == null){
                    opp.addError('Expiration Date is not avaliable.');
                
                }
                else{
                
                    Compsure_SendEmail_Controller.sendEmail(opp.id);
                    system.debug('$$$'+opp.stageName);
                        
                }
            }
        }
    }
    }