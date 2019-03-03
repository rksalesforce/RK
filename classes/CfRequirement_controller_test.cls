@isTest
public class CfRequirement_controller_test{
   
    static testmethod void Test_Save(){
     Account acc = new Account(name = 'test');
     insert acc;
        CfRequirement_controller acr = new CfRequirement_controller();
        acr.save();
    }
}