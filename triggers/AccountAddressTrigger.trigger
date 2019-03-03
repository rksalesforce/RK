trigger AccountAddressTrigger on Account (before insert, before update) {
    for(Account acc : trigger.new){
        if((acc.BillingPostalCode!=Null||acc.BillingPostalCode!='') && acc.Match_Billing_Address__c == true){
                acc.shippingPostalCode = acc.BillingPostalCode;
        }
    }
}