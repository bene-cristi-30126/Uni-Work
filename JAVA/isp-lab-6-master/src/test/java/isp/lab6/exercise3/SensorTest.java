package isp.lab6.exercise3;

import java.util.List;
import org.junit.Test;

import static org.junit.Assert.*;

public class SensorTest {
  
    @Test
    public void testAddSensorReading() {
        final SensorReading reading = new SensorReading(12,8);
        final Sensor firstSensor = new Sensor("Dell", SensorType.TEMP);

        firstSensor.addSensorReading(reading);
        assertEquals("Value of the sensor shuld be '12.0'", "12.0","" + firstSensor.readings.get(0).value);
        assertEquals("Date of the sensor reading should be 8", 8, firstSensor.readings.get(0).dateAndTime);
    }
    
     @Test
    public void testGetSensorReadingSortedByValue() {
        SensorCluster control = new SensorCluster();
        control.addSensor("1",SensorType.TEMP);
        
        control.writeSensorReading("1",1,91);
        control.writeSensorReading("1",7,92);
        control.writeSensorReading("1",8,9);
        
        Sensor s1 = control.getSensorById("1");
        List<SensorReading> rezi = s1.getSensorReadingSortedByValue();

        
        assertEquals("Number of sensor reading should be 3", 3, control.sensors.get(0).readings.size());
        assertEquals("Value of the sensor shuld be  '1.0'",  "1.0" , "" + control.sensors.get(0).readings.get(0).value);
        assertEquals("Value of the sensor shuld be  '7.0'",  "7.0" , "" + control.sensors.get(0).readings.get(1).value);
        assertEquals("Value of the sensor shuld be  '8.0'",  "8.0" , "" + control.sensors.get(0).readings.get(2).value);
    }
}