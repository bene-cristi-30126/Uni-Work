package isp.lab6.exercise3;

import java.util.ArrayList;

class SensorCluster{
    ArrayList<Sensor> sensors = new ArrayList<>();

    public void addSensor(String id, SensorType type){
        sensors.add(new Sensor(id, type));
    }

    public void writeSensorReading(String id, double value, long dtaeTime){
        for(Sensor s: sensors){
            if(s.id.equals(id)){
                s.addSensorReading(new SensorReading(value,dtaeTime));
            }
        }
    }

    public Sensor getSensorById(String id){
        for(int i=0;i<sensors.size();i++) {
            if(sensors.get(i).id==id)
                return sensors.get(i);
        }
        return null;
    }

}
