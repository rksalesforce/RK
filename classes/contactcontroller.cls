public   class contactcontroller {
     @AuraEnabled
    public static Contact save(contact con)
    {
     insert con;
        return con;
    }
}