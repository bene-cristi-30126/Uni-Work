package isp.lab3.exercise3;

import org.junit.Assert;
import org.junit.Test;

public class VechileTest {
    @Test
    public void TesttoString(){
        Vechile c1 = new Vechile("Udi","Quatro",199,'D');
        Assert.assertEquals("Value should be 'Udi (Quatro) 199 fuel type D'","Udi (Quatro) 199 fuel type D",c1.toString());
        
    }
}
