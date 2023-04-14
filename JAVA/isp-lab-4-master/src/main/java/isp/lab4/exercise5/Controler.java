package isp.lab4.exercise5;


public class Controler {
    
    private TemperatureSensor[] TemperatureSensor = new TemperatureSensor[3];
    
    private FireAlarm FireAlarm = new FireAlarm(false);
    
    public void controlStep(){
        if(     this.TemperatureSensor[0].getValue() > 50 ||
                this.TemperatureSensor[1].getValue() > 50 ||
                this.TemperatureSensor[2].getValue() > 50){
            FireAlarm.setActive(true);
            System.out.println("Fire alaram started");
        }
        else{
            FireAlarm.setActive(false);
            System.out.println("Fire alaram NOT started");
        }       
    }

    public Controler() {
    }

    public FireAlarm getFireAlarm() {
        return FireAlarm;
    }

    public void setTemperatureSensor(TemperatureSensor[] TemperatureSensor) {
        this.TemperatureSensor = TemperatureSensor;
    }
    
    

}
