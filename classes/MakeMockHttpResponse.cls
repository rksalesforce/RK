@isTest
global class MakeMockHttpResponse implements HttpcalloutMock{
  //Implement HttpResponse Method
    Global HttpResponse respond(HttpRequest request){
        //request to only a jsontest endPoint with GET method
        system.assertequals('http://cookie.jsontest.com/' , request.getEndPoint());
        system.assertEquals('GET' , request.getMethod());
        //Create Fake Response
        HttpResponse response = new HttpResponse();
        response.setHeader('content-type','application/json');
        response.setBody('{"cookie_status":"Cookie set with name jsontestdotcom"}');
        response.setstatuscode(200);
        return response;
    }
}