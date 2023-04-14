
package aut.utcluj.isp.ex3;

public class Drone {

    private String id;
    private boolean started;
    private int altitude;

    Drone(String d1, boolean b, int i) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    Drone() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    Drone(String dR3, boolean b) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Move the drone up.
     * Altitude will be incremented by 1 unit each time this method is invoked
     */
    public void moveUp() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Move the drone down
     * Altitude will be decremented by 1 unit each time this method is invoked
     */
    public void moveDown() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    /**
     * Retrieve the current altitude
     * @return current altitude
     */
    public int getAltitude() {
        return -1;
    }

}
