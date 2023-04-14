/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aut.utcluj.isp.ex4;

/**
 * @author mihai.hulea
 */
public class Engine {
    public final static int MAX_SPEED = 10;
    private boolean started;
    private int speed;

    /**
     * Start the engine
     */
    public void start() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Stop the engine
     */
    public void stop() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Increase the speed by 1 unit.
     * The current speed cannot be greater than {@link Engine#MAX_SPEED}
     */
    public void increaseSpeed() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Decrease the speed
     * The current speed cannot be lower than 0
     */
    public void decreaseSpeed() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Get the current speed
     *
     * @return
     */
    public int getSpeed() {
        return speed;
    }

    /**
     * Check if engine is started
     *
     * @return true if started, false otherwise
     */
    public boolean isStarted() {
        return false;
    }
}
