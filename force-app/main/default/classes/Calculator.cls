public inherited sharing Class Calculator {
    public static Double addition(Double num1, Double num2){
        calculatorServices.CalculatorImplPort calculator = 
            new calculatorServices.CalculatorImplPort();
        double result = calculator.doAdd(num1, num2);
        System.debug('Result of addition is: '+result);
        return result;
    }
}