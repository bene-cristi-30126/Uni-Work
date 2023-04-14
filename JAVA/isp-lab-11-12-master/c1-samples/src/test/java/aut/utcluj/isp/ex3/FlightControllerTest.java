/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aut.utcluj.isp.ex3;

import java.util.List;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author mihai.hulea
 */
public class FlightControllerTest {
    
    public FlightControllerTest() {
    }

    @Test
    public void testAddAndCountDrone() {
        System.out.println("addDrone");
        final Drone d1 = new Drone("D01",false);
        final Drone d2 = new Drone("D02",false);
        final Drone d3 = new Drone("D03",false);
        final FlightController ctrl = new FlightController();
        ctrl.addDrone(d1);
        assertEquals("Number of drones should be 1.", 1, ctrl.count());
        ctrl.addDrone(d2);
        ctrl.addDrone(d3);
        assertEquals("Number of drones should be 3.", 3, ctrl.count());
    }

    @Test
    public void testFindById() {
        System.out.println("findById");
        String id = "DR3";
        final FlightController ctrl = new FlightController();
        final Drone expResult = new Drone("DR3", false);
        ctrl.addDrone(new Drone("DR3",false));
        final Drone result = ctrl.findById(id);
        assertTrue("Drone with id DR3 should be found. Comparing expected with actual result use equals.", expResult.equals(result));
        assertNull("Should return null if id not found", ctrl.findById("DR7")); 
    }

    @Test
    public void testGetAllByState() {
        System.out.println("getAllByState");
        boolean state = false;
        final FlightController ctrl = new FlightController();
       
        final Drone d1 = new Drone("DR1", false);
        final Drone d2 = new Drone("DR2", true);
        final Drone d3 = new Drone("DR3", false);
        
        
        ctrl.addDrone(d1);
        ctrl.addDrone(d2);
        ctrl.addDrone(d3);
        
        List<Drone> result = ctrl.getAllByState(false);
        assertEquals(result.size(), 2);

        List<Drone> result2 = ctrl.getAllByState(true);
        assertEquals(result2.size(), 1);
        
    }

    @Test
    public void testRemove() {
        System.out.println("count");
        final FlightController instance = new FlightController();
        final Drone d1 = new Drone("DR1", false);
        final Drone d2 = new Drone("DR2", true);
        final Drone d3 = new Drone("DR3", false);
        
        instance.addDrone(d1);
        instance.addDrone(d2);
        instance.addDrone(d3);
        
       
        assertEquals("Should have 3 drones.", 3, instance.count());
        instance.remove("DR2");
        assertEquals("Should remain 2 drones.", 2, instance.count());
        
    }
    
}
