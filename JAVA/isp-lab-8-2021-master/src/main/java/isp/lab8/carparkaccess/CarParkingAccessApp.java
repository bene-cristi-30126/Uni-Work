package isp.lab8.carparkaccess;

import java.io.IOException;

public class CarParkingAccessApp {
    public static void main(String[] args) throws InterruptedException, IOException {      
        ParkingAccessControl pac = new ParkingAccessControl();
        
   
        Car c2 = new Car("CJ-09-SOL", System.currentTimeMillis());        
        pac.carEntry(c2); 
        Car c3 = new Car("CJ-08-SOL", System.currentTimeMillis());        
        pac.carEntry(c3); 
        int price= pac.carExit(c2.getPlateNumber());
        pac.carEntry(c2); 

                
        pac.viewCurrentCars();
        pac.viewPastEntriesForCar(c2.getPlateNumber());
        pac.viewPastUniqueEntries(c2.getPlateNumber());
    }
}
