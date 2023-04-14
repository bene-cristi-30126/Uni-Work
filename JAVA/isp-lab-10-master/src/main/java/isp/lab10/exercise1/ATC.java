package isp.lab10.exercise1;

import java.util.ArrayList;

public class ATC {
    private final ArrayList<Aircraft>  aircrafts = new ArrayList<>();
    
    public void addAirCraft(String id) {
        aircrafts.add(new Aircraft(id)); 
    }

    public void sendCommand(AtcCommand cmd){    
        cmd.execute();
    }
    
    public void showAircrafts(){
        for(int i=0; i<aircrafts.size(); i++)
            System.out.println( aircrafts.get(i).getId() + " " + 
                                aircrafts.get(i).getLatitude() + " " +
                                aircrafts.get(i).getAirCraftStatus());
    }
    
    public Aircraft getAirCraftById(String id){
        for(int i=0; i<10; i++){
            if(aircrafts.get(i).getId().equals(id)){
                return aircrafts.get(i);
            }
        }
        return null;
    }  
}


