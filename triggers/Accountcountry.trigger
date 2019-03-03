trigger Accountcountry on Account (before insert)
{
    for(Account acc :trigger.new){
        acc.billingcity = 'Hyderabad';
    }
}