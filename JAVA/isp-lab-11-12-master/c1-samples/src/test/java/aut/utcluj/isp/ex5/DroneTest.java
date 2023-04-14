/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aut.utcluj.isp.ex5;

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
    public void testStructure() {
        Drone ops = new Drone();
        assertTrue("Drone should have type Operations.", ops instanceof Operations);       
    }
    
}
