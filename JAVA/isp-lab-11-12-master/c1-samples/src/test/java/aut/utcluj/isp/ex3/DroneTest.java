/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aut.utcluj.isp.ex3;

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
    public void testMoveUp() {
        System.out.println("moveUp");
        final Drone instance = new Drone("D1", true, 0);
        instance.moveUp();
        assertEquals("Drone altitude should be 1.", instance.getAltitude(),1);
        instance.moveUp();
        instance.moveUp();
        assertEquals("Drone altitude should be 3.", 3, instance.getAltitude());
        
    }

    @Test
    public void testMoveDown() {
        System.out.println("moveDown");
        final Drone instance = new Drone("D1", true, 10);
        instance.moveDown();
        assertEquals("Drone altitude should be 9.", 9, instance.getAltitude());
        instance.moveDown();
        assertEquals("Drone altitude should be 8.", 8, instance.getAltitude());
        
    }

    @Test
    public void testGetAltitude() {
        System.out.println("getAltitude");
        final Drone instance = new Drone();
        int expResult = 0;
        int result = instance.getAltitude();
        assertEquals("Done altitude should be 0.", expResult, result);
    }
    
}
