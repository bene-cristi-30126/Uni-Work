package isp.lab4.exercise1;

//import isp.lab4.exercise0.CarAlarm; //NU ASA

public class Exercise1 {

    public static void main(String[] args) {
        TemperatureSensor termos = new TemperatureSensor();
        
        TemperatureSensor BackofHand = new TemperatureSensor(3,"Cluj");
        
        System.out.println(BackofHand.getValue());
        
        System.out.println(BackofHand.getLocation()); 

        System.out.println(BackofHand.toString()); 
        
    }
}
