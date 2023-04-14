package isp.lab4.exercise3;

public class FireSenzor {
    private boolean active;

    public FireSenzor(boolean active) {
        this.active = active;
    }
    
    public boolean isActive() {
        return active;
    }
    
    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "FireSenzor{" + "active=" + active + '}';
    }
    
}
