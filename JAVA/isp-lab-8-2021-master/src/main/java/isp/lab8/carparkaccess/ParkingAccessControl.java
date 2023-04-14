/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package isp.lab8.carparkaccess;

import isp.lab8.carparkaccess.file.FilesAndFoldersUtil;
import isp.lab8.carparkaccess.file.ParkingAccessFileControl;
import isp.lab8.carparkaccess.file.SerializableUtil;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author mihai.hulea
 */
public class ParkingAccessControl {

    public static final int MAX_CAPACITY = 25; 
    private ArrayList<Car>  parkedCars = new ArrayList<>();
    private ArrayList<Car>  previousCars = new ArrayList<>(); 
    
    private String working_folder="C:\\Scoala\\isp-labs-2022-bene-cristi-30126\\isp-lab-8-2021-master\\docs\\Parking8";
    private  int UNIT_PRICE = 1; 
    
    private List<String> files = FilesAndFoldersUtil.getFilesInFolder(working_folder);
    private File directory=new File("C:\\Scoala\\isp-labs-2022-bene-cristi-30126\\isp-lab-8-2021-master\\docs\\Parking8");
    private int ParkingSpotsOccupied=directory.list().length;
    private List<String> HistoryList = new ArrayList<String>();
    
    private File History=new File("C:\\Scoala\\isp-labs-2022-bene-cristi-30126\\isp-lab-8-2021-master\\docs\\ParkingHistory8.txt"); 

    public ParkingAccessControl(){
        
        try{
            Scanner s = new Scanner(History);
            while (s.hasNext()){
                HistoryList.add(s.next());
            }
            s.close();
        }
        catch(Exception e) {
          }
        
    }
    
    
    
    
    public void carEntry(Car car){
        
        File file1 = new File(working_folder+"\\car_"+car.getPlateNumber()+".dat");
        //1. sa verific capacitatea 
        //2. daca capacitatea este depasita -> return 
        //3. verific daca nu cumva masina este deja in parcare, si daca este -> return 
        //4. daca masina nu este in parcare salvez obiectul de tip car in parkedCars 
        
        try {
            if(ParkingSpotsOccupied>=MAX_CAPACITY){
                System.out.println("The CarPark is FULL!");
                return;
            }
            else
                if(file1.exists() && !file1.isDirectory()){
                    System.out.println("Car "+car+" is alrdeay in the car park!");
                    return;
                }else{
                    System.out.println("Car "+car+" is entering car park!");                    
                    SerializableUtil.writeVehicle(car, working_folder+"\\"+"car_"+car.getPlateNumber()+".dat"); 
            
                    parkedCars.add(car);
                    createCarsEntriesHistory(parkedCars);
                }
            
        }
        catch (IOException ex) {
            Logger.getLogger(ParkingAccessFileControl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public int CheckSpaceAvailable(){
        return MAX_CAPACITY-ParkingSpotsOccupied;
    }
    
    public int carExit(String plateNumber){
        boolean found=false; int k=0;
        //1. cautam dupa plate number un Car in parkedCars
        //2. daca nu am gasit plateNumber -> return 
        //3. daca am gasit masina, 
            //calculez timpul de asteptare in parcare, -> System.currentTimeMiliseconds()
            //calculez pretul, 
            //sterg masina din parkedCars si o adaug in previousCars
            //returnez pretul
            //get all files in working folder
            //get vehicle and look for plate number
        try{
          
          for(String f: files){
              System.out.println("Search "+f);
              Car v = (Car)SerializableUtil.readVehicle(working_folder+"\\"+f);
              if(v.getPlateNumber().equals(plateNumber)){
                   //if plate number found calculate price, remove vehicle and return price
                  System.out.println("Car with plate number "+plateNumber+" is exiting");
                  parkedCars.remove(v);     previousCars.add(v);
                  
                  long stay = (System.currentTimeMillis() - v.getEntryTime())/1000;
                  FilesAndFoldersUtil.deleteFile(working_folder+"\\car_"+plateNumber+".dat");
                  
                  found=true;
                  BufferedWriter writer = new BufferedWriter(new FileWriter(History));
            
                  for(String h:HistoryList){
                    if(k%2==0)
                        writer.write(h+" ");
                    else
                        writer.write(h+" \n");
                    k++;
                }
                    writer.close();
                  return (int)(stay * UNIT_PRICE);
              }
                          
          }
          if(!found){
              System.out.println("Car with plate number "+plateNumber+" not in the Parking");
                  return -1;
          }
          
        }catch(Exception e){
        }
        return -1; 
    }
    
    public int CalculareUsageCost(Car v){
        try{
          long stay = (System.currentTimeMillis() - v.getEntryTime())/1000;
                  return (int)(stay * UNIT_PRICE);
                           
          }
          catch(Exception e) {
          }
        return -1; 
    }
        
    
    
    
    public void viewCurrentCars(){
        System.out.println("\n Current cars:\n");
        try{
            for(String f: files){
                Car v = (Car)SerializableUtil.readVehicle(working_folder+"\\"+f);
                System.out.println("Car with plate number "+f.replace(".dat", "")+" Price at "+CalculareUsageCost(v));            
            }
        }
          catch(Exception e) {
          }
        System.out.println("\n Available space is:" + CheckSpaceAvailable());
    }
    
    
    
    public void createCarsEntriesHistory(ArrayList<Car>  Cars){ 
        int k=0;
        try{
            BufferedWriter writer = new BufferedWriter(new FileWriter(History));
            
            for(String f:HistoryList){
                if(k%2==0)
                    writer.write(f+" ");
                else
                    writer.write(f+" \n");
                k++;
            }

            for(int i=0; i<Cars.size(); i++)
                writer.write("car_"+Cars.get(i).getPlateNumber()
                             +" entered_at_"+Cars.get(i).getEntryTime()+"\n");

            writer.close();
        }
        catch(Exception e) {
          }
    }
    
    
    public void viewPastEntriesForCar(String plateNumber){
        String s= "car_"+plateNumber;
        for(int i=0; i<HistoryList.size(); i=i+2)
            if(s.equals(HistoryList.get(i)))
                System.out.println(HistoryList.get(i));
    }
    
    
    public void viewPastUniqueEntries(String plateNumber){
        int Entries=0;
        String s= "car_"+plateNumber;
        for(int i=0; i<HistoryList.size(); i=i+2)
            if(s.equals(HistoryList.get(i)))
                Entries++;
        if(Entries>1)
            System.out.println("Over Unique Past Entrie");
        else
            if(Entries==1)
                System.out.println("Unique Past Entrie");
                else
                System.out.println("No Entrie");
                
    }

    public ArrayList<Car> getParkedCars() {
        return parkedCars;
    }
}
