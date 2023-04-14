package isp.lab4.exercise5;

import org.junit.Assert;
import org.junit.Test;

public class HouseTest {
    @Test
    public void TestcontrolStep(){
        
    TemperatureSensor[] Observator = new TemperatureSensor[3];
    Observator[0] = new TemperatureSensor(60,"Cluj-Est");
    Observator[1] = new TemperatureSensor(4,"Cluj-Vest");
    Observator[2] = new TemperatureSensor(5,"Feleac");
    
    Controler Cernobil = new Controler();
    
    Cernobil.setTemperatureSensor(Observator);
    
    House Ikea = new House(Cernobil);
        
        Ikea.getControler().controlStep();
  
        Assert.assertEquals("Values should be true",true,Ikea.getControler().getFireAlarm().isActive() );
    }
    
}
