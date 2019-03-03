public class CreateCandidateController {
@auraEnabled
    public static void insertCandidate(Candidate__c cnd){
        insert cnd;
    }
}