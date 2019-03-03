public class MyPageController{
    public static String log = '';

    public PageReference doSomeDML(){
        log += 'Starting doSomeDML(); - Trigger.isExecuting = '+Trigger.isExecuting+'\n';
        insert new Contact(LastName = 'Dummy contact');
        return null;
    }

    public String getLog(){
        return log;
    }
}