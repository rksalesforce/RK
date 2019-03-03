trigger mpList_trigger on Opportunity (before update) {
    if(trigger.isupdate && trigger.isbefore){
    for(Opportunity opp : trigger.old){
       ApexPages.StandardController stdAcc = new ApexPages.StandardController(opp);
        string tt = mpList_Controller.selectedmarketprovider;
        system.debug('ttttt '+tt);
        mpList_Controller m = new mpList_Controller(stdAcc );
        mpList_Controller.show(opp.id);
        }
    }
}