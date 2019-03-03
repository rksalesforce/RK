Public class ActionSampleController {

  Public string accName{get;set;}
  
  //Using action Function
  Public void createAcccount(){
    Account acc = new Account ( Name = accName );
    insert acc;
  } 
}