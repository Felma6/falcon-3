@IsTest(seeAllData=false)
public inherited sharing Class RestCalloutTest {
    
    @IsTest
    static void makeGetCalloutSuccess(){
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpMockCallout());

        Test.startTest();
        RestCallout.makeGetCallout();
        Test.stopTest();
    }
}