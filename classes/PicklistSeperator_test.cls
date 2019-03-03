@isTest
public class PicklistSeperator_test{
    static testmethod void test_PicklistSeperatorMethod(){
    test__C t = new Test__C(name='test',states__C='Andhra');
    insert t;
        PicklistSeperator.PicklistSeperatorMethod();
    }
}