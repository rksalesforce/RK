@RestResource(URLMapping='/RestAccount2/*')
Global class RestAccount2{
    @HttpGET
    global static Account show(){
    system.debug('TTTTTTT');
        Account acc = new Account();
        acc = [Select id,name,phone,type,(select firstname,lastname from Contacts) from Account LIMIT 1];
        return acc;
    }
}