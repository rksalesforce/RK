public class CfRequirement_controller {
public Account acc{get;set;}

public CfRequirement_controller (){
    acc = new Account();
}

public void Save(){
    insert acc;
}
}