global class Contactwrapper{

public list<Contacts> clist{get;set;}


global class Contacts
    {
       global string id{get;set;}
       global string name{get;set;}
       global string email{get;set;}
       global string address{get;set;}
       
       global string gender{get;set;}
        
       global phone phones{get;set;}
    }
    global class phone
    {
        global string mobile{get;set;}
        global string home{get;set;}
        global string office{get;set;}
    }
}