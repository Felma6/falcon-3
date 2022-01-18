@IsTest(seeAllData = true)
public inherited sharing Class CalculatorTest {
    @IsTest 
    public static void doAddTest(){
        Test.setMock(WebServiceMock.class, new CalculatorCalloutDoAddMock());

        Test.startTest();
        double num1 = 2.0;
        double num2 = 3.0;
        double result = Calculator.addition(num1, num2);
        Test.stopTest();
        double expected = 5.0;
        System.assertEquals(expected, result, 'The result should be 5.0');
    }
}