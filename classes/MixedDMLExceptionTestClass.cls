Public class MixedDMLExceptionTestClass
{
    Public static void DoDMLOperations()
    {
        User u = [select id, username, isActive from user where username = 'ramki.m@gmail.com' limit 1];
        
        if(u != null )
        {
            system.debug('User Record is...: '+ u);
            
            u.isActive = true;
            update u;
            
            System.debug('User Record Updated Successfully. : ' + u);
        }
        
        UpdateAccount();
        
    }
    
    @future()
    Public static void UpdateAccount()
    {
        Account acc = [select id, name, rating, annualrevenue from account where name ='Query String Test' limit 1];
        system.debug('Account Record is....: '+ acc);
        
        if(acc != null)
        {
            acc.annualrevenue = 60000;
            update acc;
            
            System.debug('Account Record Updated Successfully. : '+ acc);
        }
        
    }
}