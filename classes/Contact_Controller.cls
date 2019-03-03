public class Contact_Controller {
public contact con{get;set;}

public Contact_Controller (){
    con = new Contact();
}

public void save(){
    insert con;
}
}