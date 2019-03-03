public class PickList {

public String seletedValue{get;set;}
public List<SelectOption> lstOptions{get;set;}
public string currentlocation{get;set;}

public void CountryNames(){
    lstOptions = new List<SelectOption>();
    lstOptions.Add(new selectoption('','===None==='));
    lstoptions.Add(new SelectOption('IND','India'));
    lstOptions.Add(new selectOption('jpn','Japan'));
}

public Void Show(){
    system.debug('TTTT '+currentlocation);
}
}