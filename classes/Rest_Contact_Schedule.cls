Global class Rest_Contact_Schedule implements schedulable{
  
      public static final String JOBNAME = 'Rest_Contact_Schedule';

    global void Execute(schedulableContext cx){
        http_Contacts_Controller1 ht = new http_Contacts_Controller1();
        ht.doSave();
    }
     public static void scheduleMe(DateTime runtime) {
        
        runtime = (runtime!=null) ? runtime : System.now().addMinutes(1);
        if ( runtime >= System.now() ) {
            DateTime next = runtime;
            String cron = next.second() + ' ' + next.minute() + ' ' + next.hour() + ' ' +
                            next.day() + ' ' + next.month() + ' ? ' + next.year();

            Id jobId = System.schedule(JOBNAME , cron, new Rest_Contact_Schedule());
            // do something with the jobId, like keep track of the job in a custom setting, perhaps?
        }
    }
}