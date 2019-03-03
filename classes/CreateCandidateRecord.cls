public with sharing class CreateCandidateRecord {

@AuraEnabled
    public static void createRecord (Account candidate){
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+candidate);
            
            if(candidate != null){
                insert candidate;
            }
            
        } catch (Exception ex){
            
        }
        
    }    
}