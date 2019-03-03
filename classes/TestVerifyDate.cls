@isTest
public class TestVerifyDate {
    static testmethod Void tt1(){
Date dt = system.today();
Date dt1 = system.today();

        VerifyDate.CheckDates(dt,dt1);
    }
    
    static testmethod Void tt2(){
Date dt = system.today().AddDays(23);
Date dt1 = system.today().AddDays(123);

        VerifyDate.CheckDates(dt,dt1);
    }
}