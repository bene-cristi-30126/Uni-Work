package isp.lab6.exercise3;


import java.util.List;
import org.junit.Test;

import static org.junit.Assert.*;

public class SensorClusterTest {
    @Test
    public void testAddSensor() {
        final Sensor firstSensor = new Sensor("Dell", SensorType.TEMP);
        final SensorCluster Controller = new SensorCluster();

        Controller.addSensor("Dell", SensorType.TEMP);
        assertEquals("SensorCluster size should be 1", 1, Controller.sensors.size());
    }
    
    @Test
    public void testWriteSensorReading() {
        SensorCluster control = new SensorCluster();
        control.addSensor("2",SensorType.TEMP);

        control.writeSensorReading("2",8,9);
        assertEquals("Id of Sensor should be '2'",    "2",      "" + control.sensors.get(0).id);
        assertEquals("Value of he sensor reading should be '8.0'",  "8.0" , "" + control.sensors.get(0).readings.get(0).value);
    }
    
    @Test
    public void testGetSensorById() {
        SensorCluster control = new SensorCluster();
        control.addSensor("1",SensorType.TEMP);
        
        control.writeSensorReading("1",1,91);
        control.writeSensorReading("1",7,92);
        control.writeSensorReading("1",8,9);
        
        Sensor s1 = control.getSensorById("1");

        assertEquals("Id of Sensor should be '1'",  "1" , "" + s1.id);
        assertEquals("Date and Time of reading should be 91",  91 ,  s1.readings.get(0).dateAndTime);
        assertEquals("Date and Time of reading should be 92",  92 ,  s1.readings.get(1).dateAndTime);
        assertEquals("Date and Time of reading should be 9",  9 ,  s1.readings.get(2).dateAndTime);
    }
}
