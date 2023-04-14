package isp.lab4.exercise2;

public class Exercise2 {
    
    public static void main(String[] args) {
        FireAlarm Emerson = new FireAlarm(false);
        
        Emerson.setActive(true);
        
        System.out.println(Emerson.isActive());

        System.out.println(Emerson.toString()); 
        
    }    
}
