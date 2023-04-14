/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aut.utcluj.isp.ex4;

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
    public void testGoUp() {
        System.out.println("goUp");
        Drone instance = new Drone();
        instance.goUp();
        instance.goUp();
        instance.goUp();
        assertEquals("Should have altitude 3.", 3, instance.getAltitude());
        instance.goUp();
        assertEquals("Should have altitude 4.", 4, instance.getAltitude());
    }

    @Test
    public void testStartEngine() {
        System.out.println("startEngine");
        Drone instance = new Drone();
        instance.startEngine();
       
    }

    @Test
    public void testGoDown() {
        Drone instance = new Drone();
        instance.goUp();
        instance.goUp();
        assertEquals("Should have altitude 2", 2, instance.getAltitude());
        instance.goDown();
        assertEquals("Should have altitude 1", 1, instance.getAltitude());
        instance.goDown();
        assertEquals("Should have altitude 0", 0, instance.getAltitude());
    }

    @Test(expected = NegativeAltitudeException.class)
    public void testGoDownThrowExceptionIfAltitudeIsNegative() {
        Drone instance = new Drone();
        instance.goUp();
        assertEquals("Should have altitude 1", 1, instance.getAltitude());
        instance.goDown();
        assertEquals("Should have altitude 0", 0, instance.getAltitude());
        instance.goDown();
    }
    
}
