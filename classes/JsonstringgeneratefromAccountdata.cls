public  class JsonstringgeneratefromAccountdata {

     public void jsongenerate(){
          JSONGenerator gen = JSON.createGenerator(true);
          gen.writeString('Account Data');
          gen.writeStartArray();
          for(Account actobj:[select id,name,type,Industry from Account limit 2]){
              gen.writeStartObject();
                   gen.writeStringField('Account Name',actobj.Name);
                   gen.writeStringField('Account Type',actobj.Type);
                   gen.writeStringField('Account Industry',actobj.Industry);
              gen.writeEndObject();
          }
          gen.writeEndArray();
          System.debug('Json Account Structure:'+gen.getAsString());
     }
}