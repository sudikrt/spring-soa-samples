public with sharing class SampleHttpCallout {
    
    private static final String END_POINT = 'https://postman-echo.com/get?foo1=bar1&foo2=bar2';
    private static final String REQUEST_METHOD = 'GET';
    
    public static HttpResponse doCallout () {
        HttpRequest request =  new HttpRequest ();
        
     	request.setMethod(REQUEST_METHOD);
        request.setEndpoint(END_POINT);
        request.setTimeout(120000);
        Http httpObj = new Http ();
        HttpResponse response = httpObj.send(request);
        if (response.getStatusCode() == 200 || response.getStatus() == 'OK') {
             System.debug(response.getBody());
        } else {
         	System.debug('Invalid status');   
        }
        return response;
    }
}