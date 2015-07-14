public class DemoConstructor {
    
    String name;
    Integer age;
    
    public DemoConstructor(){
        
        System.debug('It is a default constructor');
    }
    
    public DemoConstructor(String name, Integer age){
        name = name;
        age = age;
        System.debug('It is a parameterized constructor');
        System.debug('Name = '+name+' Age = '+age);
    }

}