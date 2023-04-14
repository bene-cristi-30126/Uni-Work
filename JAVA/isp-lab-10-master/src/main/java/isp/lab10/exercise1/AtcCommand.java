package isp.lab10.exercise1;

import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

abstract class AtcCommand{
    protected Aircraft airplane;

    public AtcCommand(Aircraft airplane) {
        this.airplane = airplane;
    }
    
    abstract String execute();
}


        //////////////////  TAKE OFF

class TakeoffCommand extends AtcCommand{
    private int altitude;

    public TakeoffCommand(int altitude, Aircraft airplane) {
        super(airplane);
        this.altitude = altitude;
    }

    public int getAltitude() {
        return altitude;
    }
    

    @Override
    public String execute(){
        airplane.setAltitude_increment(altitude);
        airplane.TakeOff();
        return "EXECUTED!";
    }
}


        /////////////////////// LAND

class LandCommand extends AtcCommand{
    public LandCommand(Aircraft airplane) {
        super(airplane);
    }

    @Override
    public String execute(){
        airplane.Land();
        return "EXECUTED!";
    }
}