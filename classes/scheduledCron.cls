global class scheduledCron implements Schedulable{
global void execute(SchedulableContext SC) {

        contactcreate abc = new contactcreate();
        abc.createcontact();
    }
}