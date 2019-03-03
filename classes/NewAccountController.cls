public class NewAccountController {
@AuraEnabled
    public static void AccInsert(Account acc){
        insert acc;
    }
}