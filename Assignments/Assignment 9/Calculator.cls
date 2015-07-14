public class Calculator {
    String operation;
    Integer input1, input2;
    Integer result;
    public Calculator(String operation, Integer input1, Integer input2){
        operation = operation;
        input1 = input1;
        input2 = input2;
        
        if(operation == 'SUM'){
            result = input1 + input2;
            System.debug('Addition of '+input1+' and '+input2+' is '+result);
        }
        else if(operation == 'SUB'){
            result = input1 - input2;
            System.debug('Subtraction of '+input1+' and '+input2+' is '+result);
        }
        else if(operation == 'MUL'){
            result = input1 * input2;
            System.debug('Multiplication of '+input1+' and '+input2+' is '+result);
        }
        else if(operation == 'DIV'){
            result = input1 / input2;
            System.debug('Division of '+input1+' and '+input2+' is '+result);
        }
      
    }

}