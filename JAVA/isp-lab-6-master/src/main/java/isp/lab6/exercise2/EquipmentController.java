package isp.lab6.exercise2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EquipmentController {

    List<Equipment> list = new ArrayList<>();
    /**
     * Add new equipment to the list of equipments
     *
     * @param equipment - equipment to be added
     */
    public void addEquipment(final Equipment equipment) {
        list.add(new Equipment(equipment.getName(),equipment.getSerialNumber(),equipment.getOwner()));
    }
    

    /**
     * Get current list of equipments
     *
     * @return list of equipments
     */
    public List<Equipment> getEquipments() {
        for (int i=0; i<list.size(); i++)
            System.out.println(list.get(i).getName() + " " + list.get(i).getSerialNumber() + " "
                                + list.get(i).getOwner());
        return list;
    
    }

    /**
     * Get number of equipments
     *
     * @return number of equipments
     */
    public int getNumberOfEquipments() {
        return list.size();
    }
    
    
    public List<Equipment> findAllByOwner(String owner) {
     List<Equipment> listByOwner = new ArrayList<>();
     for(int j =0; j<list.size(); j++) {
            if(owner.equals(list.get(j).getOwner()) ) {
               listByOwner.add(list.get(j));
            }
        }
     return listByOwner;
    }
    /**
     * Group equipments by owner
     *
     * @return a dictionary where the key is the owner and value is represented by list of equipments he owns
     */
    public Map<String, List<Equipment>> getEquipmentsGroupedByOwner() {
        Map<String, List<Equipment>> ownership= new HashMap<>();              
        for(int i=0; i<list.size(); i++)  {
            if(list.get(i).getOwner()!= null) {
                ownership.put(list.get(i).getOwner(), findAllByOwner(list.get(i).getOwner()));
            }
        }   
        return ownership;
    }

    /**
     * Remove a particular equipment from equipments list by serial number
     * @param serialNumber - unique serial number
     * @return deleted equipment instance or null if not found
     */
    public Equipment removeEquipmentBySerialNumber(final String serialNumber) {
        Equipment EquipmentDeleted = new Equipment(serialNumber);
        int found=0;
        for(int i=0; i<list.size(); i++) {
            if(list.get(i).getSerialNumber().equals(serialNumber)){
                System.out.println("\nFounded the Eq with the " + serialNumber);
                list.remove(i); found=1;
            }
        }
        if(found==0) {
            EquipmentDeleted=null; System.out.println("\nNOOO Eq found with the" + serialNumber);
        }
        
        return EquipmentDeleted;
    }
    
    
}
