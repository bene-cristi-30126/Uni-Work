/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aut.utcluj.isp.ex1;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author mihai.hulea
 */

public class DroneTest {
    
    public DroneTest() {
    }

    @Test
    public void testCreate() {
        System.out.println("create");
        final Drone d1 = new Drone("DR1", true);
        
        assertEquals("Drone id should be equal with DR1", "DR1",d1.getId());
        assertTrue("Drone state should be true.", d1.isState());
        
        final Drone d2 = new Drone("DR2", false);
        assertFalse("Drone state should be false.", d2.isState());
    }
    
    @Test
    public void testCreate2(){
        System.out.println("create2");
        final Drone d1 = new Drone("DR3");
        assertTrue("Drone state should be true.", d1.isState());
    }
    
    @Test
    public void testEquals(){
        final Drone d1 = new Drone("DR1", true);
        final Drone d2 = new Drone("DR1", true);
        final Drone d3 = new Drone("DR3", true);
        assertTrue("Should return true.", d1.equals(d2));    
        assertFalse("Should return false.", d1.equals(d3));
    }
    
    @Test 
    public void testDisplayObjectString(){
        final Drone d1 = new Drone("DR3", false);       
        assertEquals("Drone_DR3", d1.toString()); 
        Drone d2 = new Drone("DR4", false);     
        assertEquals("Drone_DR4", d2.toString());
    
    }
    
}
