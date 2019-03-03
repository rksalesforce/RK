public class JSON2Apex1 {

    public class JSON2Apex {
        public List<Contacts> contacts;
    }

    public class Contacts {
        public String id;
        public String name;
        public String email;
        public String address;
        public String gender;
        public Phone phone;
    }

    public class Phone {
        public String mobile;
        public String home;
        public String office;
    }

    
    public static JSON2Apex parse(String json) {
        return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
    }
}