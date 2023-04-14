package isp.lab4.exercise2;

public class FireAlarm {
    private boolean active;

    public FireAlarm(boolean active) {
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
