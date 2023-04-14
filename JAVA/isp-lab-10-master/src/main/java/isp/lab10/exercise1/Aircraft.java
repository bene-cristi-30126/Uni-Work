package isp.lab10.exercise1;

import java.util.Observable;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

enum Status {
  OnStand,
  Taxing,
  Takingoff,
  Ascending,
  Cruising,
  Descending,
  Landed,
}

public class Aircraft extends Observable implements Runnable{
    private String id;
    private int latitude;

    private Status AirCraftStatus;
    private int altitude_increment;
    private int altitude=0;

    public Aircraft(String id) {
        this.id = id;
        this.latitude =0;
        this.AirCraftStatus = Status.OnStand;
        this.altitude_increment=1;
    }

    @Override
    public void run() {
        while(true){
            if(AirCraftStatus == Status.OnStand || AirCraftStatus == Status.Landed ){
                synchronized(this){
                    try {
                        System.out.println("AirCraft is stoped");
                        
                        this.wait();

                        AirCraftStatus = Status.Taxing; System.out.println("AirCraft is in taxing");
                        this.setChanged(); this.notifyObservers();
                        
                        TimeUnit.SECONDS.sleep(10);
                        if(AirCraftStatus == Status.Taxing)       
                            AirCraftStatus = Status.Takingoff;  System.out.println("AirCraft is takingOff");
                        this.setChanged();  this.notifyObservers();
                        
                        TimeUnit.SECONDS.sleep(5);
                        if(AirCraftStatus == Status.Takingoff)       
                            AirCraftStatus = Status.Ascending; System.out.println("AirCraft is asceding");
                        this.setChanged();  this.notifyObservers();
                        
                        TimeUnit.SECONDS.sleep(10*altitude_increment);
                        if(AirCraftStatus == Status.Ascending)       
                            AirCraftStatus = Status.Cruising; 
                        
                    } catch (InterruptedException ex) {
                        Logger.getLogger(Aircraft.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }//sync
            }//.if

            try {
                TimeUnit.SECONDS.sleep(1);
            } catch (InterruptedException ex) {
                Logger.getLogger(Aircraft.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            latitude++;
            System.out.println("AirCraft is   " + AirCraftStatus +"       Traveled distance =  "+latitude+" km");
            //notify UI that this car status has changed
            this.setChanged();
            this.notifyObservers();
        }
    }//.run
    
    public void receiveAtcMessage(AtcCommand msg){
        System.out.println(msg.airplane.getAirCraftStatus());
    }

    public String getId() {
        return id;
    }

    public int getLatitude() {
        return latitude;
    }
    
    public Status getAirCraftStatus() {
        return AirCraftStatus;
    }

    public void setAirCraftStatus(Status AirCraftStatus) {
        this.AirCraftStatus = AirCraftStatus;
    }

    public void setAltitude_increment(int altitude_increment) {
        this.altitude_increment = altitude_increment;
    } 

    public int getAltitude_increment() {
        return altitude_increment;
    }
    
    public int getAltitude() {
        while(this.AirCraftStatus == Status.Ascending)
        {
            try {
                Thread.sleep(1000);
                altitude ++;
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        return altitude;
    }
    
    public void TakeOff() {
        synchronized(this){
          this.notify();
        }
    }
    

    public  void Land(){
        AirCraftStatus = Status.Descending;
        this.setChanged();  this.notifyObservers();
            try {
                TimeUnit.SECONDS.sleep(10*altitude_increment);
            } catch (InterruptedException ex) {
                Logger.getLogger(Aircraft.class.getName()).log(Level.SEVERE, null, ex);
            }
        AirCraftStatus = Status.Landed;
    }
}
