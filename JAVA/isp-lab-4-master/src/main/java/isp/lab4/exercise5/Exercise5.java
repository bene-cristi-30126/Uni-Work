package isp.lab4.exercise5;

public class Exercise5 {
    public static void main(String[] args) {
        
    TemperatureSensor[] pistol = new TemperatureSensor[3];
    pistol[0]= new TemperatureSensor(51,"Cluj");
    pistol[1]= new TemperatureSensor(2,"Braila");
    pistol[2]= new TemperatureSensor(24,"Kyev");
    
    Controler Iveco = new Controler();
    
    Iveco.setTemperatureSensor(pistol);
    
    House Dedeman= new House(Iveco);

    Dedeman.getControler().controlStep(); System.out.println(pistol[0].getValue());
    
    pistol[0].setValue(5);
    
    Dedeman.getControler().controlStep(); System.out.println(pistol[0].getValue());
    }
}
