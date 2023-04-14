/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isp.lab8.carparkaccess.file;

import isp.lab8.carparkaccess.*;
import isp.lab8.carparkaccess.file.FileReadUtil;
import isp.lab8.carparkaccess.file.FilesAndFoldersUtil;
import isp.lab8.carparkaccess.file.SerializableUtil;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Persistena pe disc utilizand mecanismul de seralizare. Pentru a funnctiona
 * clasa Car trebuie sa implementeze interfata Serializable. 
 * @author mihai.hulea
 */
public class ParkingAccessFileControl{

    private String working_folder="C:\\Scoala\\Parking8";
    private  int UNIT_PRICE = 1;
    
    public void carEntry(Car car) {
        try {
            SerializableUtil.writeVehicle(car, working_folder+"\\"+"car_"+car.getPlateNumber()+".dat");
        } catch (IOException ex) {
            Logger.getLogger(ParkingAccessFileControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int carExit(String plateNumber) {
        try{
          //get all files in working folder
          List<String> files = FilesAndFoldersUtil.getFilesInFolder(working_folder);
          
          for(String f: files){
              //get vehicle and look for plate number
              System.out.println("Search "+f);
              Car v = (Car)SerializableUtil.readVehicle(working_folder+"\\"+f);
              if(v.getPlateNumber().equals(plateNumber)){
                  //if plate number found calculate price, remove vehicle and return price
                  System.out.println("Vehicle is exiting car park.");
                  long stay = (System.currentTimeMillis() - v.getEntryTime())/1000;
                  FilesAndFoldersUtil.deleteFile(working_folder+"\\car_"+plateNumber+".dat");
                  return (int)(stay * UNIT_PRICE);
              }             
          }
          
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public void viewCurrentCars() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void viewPastEntriesForCar(String plateNumber) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void viewPastUniqueEntries(String plateNumber) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

  
    
}
