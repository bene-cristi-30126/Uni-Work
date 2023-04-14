package isp.lab8.carparkaccess;

import org.junit.Assert;
import org.junit.Test;

public class CarParkingAccessAppTest {
    ParkingAccessControl pac = new ParkingAccessControl();
    Car c2 = new Car("CJ-09-SOL", System.currentTimeMillis());        
    
    @Test
    public void TestcarEntry() {
        
        pac.carEntry(c2); 
        Assert.assertEquals("Values should be CJ-09-SOL","CJ-09-SOL",
                            pac.getParkedCars().get(0).getPlateNumber());
    }
    
    @Test
    public void TestcarExit() throws InterruptedException {
        Thread.sleep(10);
        int price= pac.carExit(c2.getPlateNumber());
        Assert.assertEquals("Values should be 10",10, price);
    }
    
    @Test
    public void TestCheckSpaceAvailable() {
        Assert.assertEquals("Values should be 24",24, pac.CheckSpaceAvailable());
    }
}
