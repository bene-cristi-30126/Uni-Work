package isp.lab4.exercise4;

public class Controler {
    
    private TemperatureSensor[] TemperatureSensor;
    
    private FireAlarm FireAlarm;
    
    public void controlStep(){
        if(     this.TemperatureSensor[0].getValue() > 50 && 
                this.TemperatureSensor[1].getValue() > 50 &&
                this.TemperatureSensor[2].getValue() > 50){
            FireAlarm.setActive(true);
            System.out.println("Fire alaram started");
        }
        else{
            System.out.println("Fire alaram NOT started");
        }       
    }

    public Controler(TemperatureSensor[] TemperatureSensor, FireAlarm FireSensor) {
        this.TemperatureSensor = TemperatureSensor;
        this.FireAlarm = FireSensor;
    }

    public FireAlarm getFireAlarm() {
        return FireAlarm;
    }
  
    
}
