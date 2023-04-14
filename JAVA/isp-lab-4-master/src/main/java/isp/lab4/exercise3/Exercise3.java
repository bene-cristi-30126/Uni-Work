package isp.lab4.exercise3;

public class Exercise3 {
    public static void main(String[] args) {
    
    TemperatureSensor pistol = new TemperatureSensor(2,"Braila");
    
    FireSenzor arduino = new FireSenzor(false);
    
    Controler Iveco = new Controler(pistol,arduino);
    
    Iveco.controlStep(); System.out.println(pistol.getValue());
    
    pistol.setValue(51);
    
    Iveco.controlStep(); System.out.println(pistol.getValue());
    }
}
