/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aut.utcluj.isp.ex2;

import static org.hamcrest.CoreMatchers.instanceOf;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author mihai.hulea
 */
public class StealthDroneTest {
    
    public StealthDroneTest() {
    }

    @Test
    public void testCreate() {
        StealthDrone d = new StealthDrone("SDR1", true, "Cluj");
        assertEquals("Drone return speciffic message when flight() called.", "Stealth Drone SDR1 is up.", d.flight());
        StealthDrone d1 = new StealthDrone("SDR2", true, "Cluj");
        assertEquals("Drone return speciffic message whenflight() called.", "Stealth Drone SDR2 is up.", d1.flight());
        assertThat("Instance should be of type 'Drone'", d1, instanceOf(Drone.class));
    }
    
}
