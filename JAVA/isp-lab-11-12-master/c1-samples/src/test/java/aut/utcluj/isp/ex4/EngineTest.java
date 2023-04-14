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
public class EngineTest {
    
    public EngineTest() {
    }

    @Test
    public void testStart() {
        System.out.println("startEngine");
        final Engine e = new Engine();
        e.start();
        assertTrue("Engine is started.", e.isStarted());
    }
    
    @Test 
    public void testIncreaseSpeed(){
        System.out.println("increaseSpeed");
        final Engine e = new Engine();
        e.increaseSpeed();
        e.increaseSpeed();
        e.increaseSpeed();
        assertEquals("Should have speed 3.", 3, e.getSpeed());
        for(int i=0;i<10;i++)
            e.increaseSpeed();
        assertEquals("Should have speed MAX_SPEED. Engine cannot go over max speed set.", Engine.MAX_SPEED, e.getSpeed());      
    }

    @Test 
    public void testDecreaseSpeed(){
        System.out.println("increaseSpeed");
        final Engine e = new Engine();
        e.increaseSpeed();
        e.increaseSpeed();
        e.increaseSpeed();
        assertEquals("Should have speed 3.", 3, e.getSpeed());
        e.decreaseSpeed();
        e.decreaseSpeed();
        e.decreaseSpeed();
        e.decreaseSpeed();
        e.decreaseSpeed();
        assertEquals("Should have speed 0.", 0, e.getSpeed());
    }
    
}
