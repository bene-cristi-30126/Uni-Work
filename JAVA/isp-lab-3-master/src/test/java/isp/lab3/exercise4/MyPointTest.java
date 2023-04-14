package isp.lab3.exercise4;

import org.junit.Test;
import org.junit.Assert;
import static org.junit.Assert.assertEquals;


public class MyPointTest {
    MyPoint p1 = new MyPoint();
    @Test
    public void testDistance1() {
        assertEquals("The distance should be 1.0", "1.0",""+p1.distance(0,0,1));
    }
    @Test
    public void testDistance2(){
        MyPoint p2 = new MyPoint(2,0,0);
        assertEquals("Values should be 2.0", "2.0",""+ p1.distance(p2));
    } 
}
