public class HomeOppList {
@AuraEnabled
      public static List <Opportunity> getopportunities() {
        return [SELECT Id, name, StageName,AccountId,probability FROM Opportunity ORDER BY createdDate ASC];
      }
}