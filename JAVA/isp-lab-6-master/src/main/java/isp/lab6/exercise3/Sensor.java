package isp.lab6.exercise3;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

class Sensor implements Comparator<SensorReading>{
    ArrayList<SensorReading> readings = new ArrayList<>();
    String id;
    SensorType type;

    public Sensor(String id, SensorType type) {
        this.id = id;
        this.type = type;
    }

    public boolean addSensorReading(SensorReading reading){
        readings.add(reading);
        return true;
    }

    List<SensorReading> getSensorReadingSortedByValue(){
        Collections.sort(readings); //aceasta metoda utilizeaaz criteriul definiti in compareTo din clasa SensorReading)
        return readings;
    }

    @Override
    public int compare(SensorReading arg0, SensorReading arg1) {
        return (int)(arg0.value-arg1.value);
    }

}
