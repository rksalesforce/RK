public class MixedDMLException_Class{
    public static void doDMLOperations(){
        user u = [select id,username,isActive from user where username = 'ramcommunityuser@gmail.com'];
            
            
        if(u!=null){
        system.debug('User Record is...: '+ u);
            u.isActive = true;
            update u;
                System.debug('User Record Updated Successfully. : ' + u);
              
        }
          dmlAccount();
        }
        @future()
        public static void DmlAccount(){
        Account acc = [select id,name,rating,annualrevenue from Account where name ='Test2' Limit 1];
        system.debug('Account Record is :'+acc);
        if(acc!=null){
            acc.annualrevenue = 1000;
            acc.rating='hot';
            update acc;
            System.debug('Account Record Updated Successfully. : '+ acc);
        }
    }
}