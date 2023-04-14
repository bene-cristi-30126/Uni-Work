package isp.lab3.exercise1;

import org.junit.Assert;
import org.junit.Test;

public class TreeTest {
    @Test
    public void testGrow() {
        Tree t1 = new Tree();
        t1.grow(2);
        Assert.assertEquals("Values should 17", 17, t1.getHeight());
    }        
    @Test
    public void testToString(){
        Tree t1 = new Tree();
        t1.grow(1);
        Assert.assertEquals("Values should be '16'","16",t1.toString());
        
    }

}
