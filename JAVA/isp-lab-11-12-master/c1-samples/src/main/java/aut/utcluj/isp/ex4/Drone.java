/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aut.utcluj.isp.ex4;

/**
 * @author mihai.hulea
 */
public class Drone {

    private Engine engine;
    private int altitude;

    /**
     * Drone can work only with an engine.
     * Move the drone up. Each time this method will be invoked, the altitude will be incremented by 1 unit
     */
    public void goUp() {
        engine.start();
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Move the drone down. Each time this method will be invoked, the altitude will be decremented by 1 unit
     * Altitude should not be negative. If negative altitude is reached, an {@link NegativeAltitudeException} exception
     * will be thrown
     */
    public void goDown() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Get current altitude
     *
     * @return the current altitude
     */
    public int getAltitude() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Start the engine
     */
    public void startEngine() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Get the current engine
     *
     * @return instance of {@link Engine}
     */
    public Engine hasEngine() {
        return engine;
    }
}
