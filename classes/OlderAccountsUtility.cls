public class OlderAccountsUtility {
 public static void updateOlderAccounts() {
      // Get the 5 oldest accounts
      Account[] oldAccounts = [SELECT Id, Description FROM Account ORDER BY CreatedDate ASC LIMIT 5];
      // loop through them and update the Description field
      for (Account acct : oldAccounts) {
          acct.Description = 'Heritage Account';
          acct.Register_Date__c = '11/11/2018';
      }
      // save the change you made
      update oldAccounts;
    }
}