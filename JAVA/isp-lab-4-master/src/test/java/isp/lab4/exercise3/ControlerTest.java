package isp.lab4.exercise3;

import org.junit.Assert;
import org.junit.Test;

public class ControlerTest {
    
    TemperatureSensor Observator = new TemperatureSensor(62,"Cluj");
    
    FireSenzor Arduino = new FireSenzor(false);
    
    Controler Cernobil = new Controler(Observator,Arduino);
    
    @Test
    public void TestcontrolStep(){
        Cernobil.controlStep();
        Assert.assertEquals("Values should be true",true,Cernobil.getFireAlarm().isActive() );
    }
    
}
