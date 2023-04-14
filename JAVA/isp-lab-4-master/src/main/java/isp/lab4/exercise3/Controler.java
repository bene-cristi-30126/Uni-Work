package isp.lab4.exercise3;

public class Controler {
    
    private TemperatureSensor TemperatureSensor;
    
    private FireSenzor FireAlarm;
    
    public void controlStep(){
        if(this.TemperatureSensor.getValue() > 50){
            FireAlarm.setActive(true);
            System.out.println("Fire alaram started");
        }
        else{
            System.out.println("Fire alaram NOT started");
        }       
    }

    public Controler(TemperatureSensor TemperatureSensor, FireSenzor FireAlarm) {
        this.TemperatureSensor = TemperatureSensor;
        this.FireAlarm = FireAlarm;
    }

    public FireSenzor getFireAlarm() {
        return FireAlarm;
    }

}
