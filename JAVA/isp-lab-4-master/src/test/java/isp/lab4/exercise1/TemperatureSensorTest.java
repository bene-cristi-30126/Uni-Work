package isp.lab4.exercise1;

import org.junit.Assert;
import org.junit.Test;

public class TemperatureSensorTest {

    TemperatureSensor BackofHand = new TemperatureSensor(12,"Alaska");
    
    @Test
    public void TestValue(){
        Assert.assertEquals("Values should be 12",12,BackofHand.getValue());
    }
    
    @Test
    public void TestLocation(){
        Assert.assertEquals("Values should be 'Alaska'","Alaska",""+ BackofHand.getLocation());
    }
    
    @Test
    public void TesttoString(){
        Assert.assertEquals("Values should be 'TemperatureSensor{value=12, location=Alaska}'","TemperatureSensor{value=12, location=Alaska}",BackofHand.toString());
    }
    
}
