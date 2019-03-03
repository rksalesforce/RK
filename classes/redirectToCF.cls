public class redirectToCF {
public pagereference redirectTo(){
    pageReference pgRef = new PageReference('https://www.google.co.in/');
    pgref.setredirect(true);
    return pgref;
}
}