package isp.lab4.exercise1;

public class TemperatureSensor {

    //atribute
    private int value;
    private String location;
    //constructori
    public TemperatureSensor(int value, String location) {
        this.value = value;
        this.location = location;
    }

    public TemperatureSensor() {
    }
    
    
    
    //metode

    public String getLocation() {
        return location;
    }

    public int getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "TemperatureSensor{" + 
                "value=" + value + 
                ", location=" + location + '}';
    }
    
}
