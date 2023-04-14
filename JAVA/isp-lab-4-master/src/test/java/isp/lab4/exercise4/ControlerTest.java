package isp.lab4.exercise4;

import org.junit.Assert;
import org.junit.Test;

public class ControlerTest {
    @Test
    public void TestcontrolStep(){
        
    TemperatureSensor[] Observator = new TemperatureSensor[3];
    Observator[0] = new TemperatureSensor(62,"Cluj-Est");
    Observator[1] = new TemperatureSensor(42,"Cluj-Vest");
    Observator[2] = new TemperatureSensor(52,"Feleac");
    
    FireAlarm Arduino = new FireAlarm(false);
    
    Controler Cernobil = new Controler(Observator,Arduino);
        
        Cernobil.controlStep();
  
        Assert.assertEquals("Values should be false",false,Cernobil.getFireAlarm().isActive() );
    }
    
}

