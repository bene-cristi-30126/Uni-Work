package isp.lab4.exercise2;

import org.junit.Assert;
import org.junit.Test;

public class FireAlarmTest {
    FireAlarm Bosch = new FireAlarm(false);
    
    @Test
    public void TestisActive(){
        Bosch.setActive(true);
        Assert.assertEquals("Values should be 'ture'","true",""+ Bosch.isActive());
    }
    
    @Test
    public void TesttoString(){
        Assert.assertEquals("Values should be 'FireSenzor{active=false}'","FireSenzor{active=false}",""+ Bosch.toString());
    }
}
