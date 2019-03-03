public class MyOppController{
    Opportunity opp;
    public MyOppController(Apexpages.StandardController sc){
        opp = (Opportunity) sc.getRecord();
    }

    public void clearTheCheckbox(){
        if(opp.stagename=='prospecting'){
            update opp;
        }
    }
}