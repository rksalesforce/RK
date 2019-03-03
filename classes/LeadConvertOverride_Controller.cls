public class LeadConvertOverride_Controller {
opportunity opp {get;set;}
    public LeadConvertOverride_Controller(ApexPages.StandardController controller) {
        opp = new Opportunity();
    }

public pageReference convertLead(){
    pageReference pgref = new pageReference('https://c.ap5.visual.force.com/lead/leadconvert.jsp?retURL=%2F00Q7F000007Z03J&id=00Q7F000007Z03J&_CONFIRMATIONTOKEN=VmpFPSxNakF4T0Mwd05DMHdPRlF3T1Rvek9Eb3pPQzQzTmpsYSxGYlJYa2MtNDRrWkZLNFpRelNxY2Z1LE4yWTBNVEJt&common.udd.actions.ActionsUtilORIG_URI=%2Flead%2Fleadconvert.jsp');
    pgref.setredirect(true);
    return pgref;
}
}