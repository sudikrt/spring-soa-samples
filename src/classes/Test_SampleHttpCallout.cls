@isTest
public class Test_SampleHttpCallout {
	
    @isTest
    static void test_0() {
        Test.setMock(HttpCalloutMock.class, new SampleHttpCalloutMock());
        HttpResponse response  = SampleHttpCallout.doCallout();
        System.assertEquals(200, response.getStatusCode());
    }
    @isTest
    static void test_1() {
        Test.setMock(HttpCalloutMock.class, new SampleHttpCalloutMock(400));
        HttpResponse response  = SampleHttpCallout.doCallout();
        System.assertEquals(400, response.getStatusCode());
    }
}