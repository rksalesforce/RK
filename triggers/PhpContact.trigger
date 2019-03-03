trigger PhpContact on Contact (before insert,after insert) {
for(Contact c : trigger.new){
   // PHPServiceClass.callWebservice(c.id);
   PHPIntegrationClass.insertContact(c.id);
   
}

if(trigger.isinsert && trigger.isbefore){
for(contact cc : trigger.new){
System.debug('Log state is: '+ MyPageController.log);
    MyPageController.log += 'In trigger ContactLogTrigger - Trigger.isExecuting = '+Trigger.isExecuting+'\n';
}
}

    
}