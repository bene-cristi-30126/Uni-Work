package isp.lab4.exercise4;

public class Exercise4 {
    public static void main(String[] args) {
        
    TemperatureSensor[] pistol = new TemperatureSensor[3];
    pistol[0]= new TemperatureSensor(51,"Cluj");
    pistol[1]= new TemperatureSensor(2,"Braila");
    pistol[2]= new TemperatureSensor(245,"Kyev");
    
    FireAlarm arduino = new FireAlarm(false);
    
    Controler Iveco = new Controler(pistol,arduino);
    
    Iveco.controlStep(); System.out.println(pistol[1].getValue());
    
    pistol[1].setValue(65);
    
    Iveco.controlStep(); System.out.println(pistol[1].getValue());
    }
}
