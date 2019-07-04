@isTest
global class SampleHttpCalloutMock implements HttpCalloutMock {
	Integer statusCode;
    public SampleHttpCalloutMock() {
        statusCode = 200;
    }
    public SampleHttpCalloutMock (Integer statusCode) {
        this.statusCode = statusCode;
    }
    
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"args":{"foo1":"bar1","foo2":"bar2"},"headers":{"x-forwarded-proto":"https","host":"postman-echo.com","content-length":"19","accept":"*/*","accept-encoding":"gzip, deflate","cache-control":"no-cache","content-type":"application/x-www-form-urlencoded","cookie":"sails.sid=s%3A0CKsXAz5WqIYuxSvKEmQbQKlK4sqd_XM.ahvIQRg47gMHwO2VG5VwxtL%2FS93K1Ikc2vbnErAvaHo","postman-token":"30a7f65a-573a-4e68-88e8-b9600cae9cd0","user-agent":"PostmanRuntime/7.15.0","x-forwarded-port":"443"},"url":"https://postman-echo.com/get?foo1=bar1&foo2=bar2"}');
        response.setStatusCode(statusCode);
        return response;
    }
}