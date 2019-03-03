public class customerRegistrationService_controller {

public Account acc{get;set;}

public customerRegistrationService_controller (){
    acc = new Account();
}

 public PageReference dosave() {
 //1.Establish Connection to source org
 //2.pass the parameters (Name,phone,city)
 
 partnerSoapSforceCom.soap myPartnerSoap = new partnerSoapSforceCom.soap();
 partnerSoapSforceCom.LoginResult partnerLoginResult = myPartnerSoap.login('admin@etg.com','etg@1234rOrt4WBlK2Cx2kgNm6eHfeh0z');
 system.debug('@@@@@@@'+partnerLoginResult);
 system.debug('Sesssoin Id is ::::'+partnerLoginResult.sessionID);
        return null;
    }
}