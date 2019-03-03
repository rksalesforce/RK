trigger MultipixklistCommaSeperated on Account (after insert,before insert,before update) {
for (Account acc : trigger.new)
{

    if (acc.states_of_operation__C!= null)
    {
        acc.selected_States__C = acc.states_of_operation__C.replace(';', ',');
    }
  
}
}