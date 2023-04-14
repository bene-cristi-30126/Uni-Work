package isp.lab6.exercise2;

import java.util.List;
import java.util.Map;

public class Exercise2 {
    public static void main(String[] args) {
        Equipment hammer = new Equipment("Ham","122","John");
        Equipment AKA47 = new Equipment("Habibi","47","Dorel");
        Equipment M4A4 = new Equipment("Machine","100","John");
        Equipment Glock = new Equipment("Pistol","9","John");
        Equipment spoon = new Equipment("SN12");
        Equipment Bazooka = new Equipment("Bomm","SN123");
        Equipment Pc = new Equipment("Computer","457","Dorel");
        Equipment Tele = new Equipment("Comunication","656","Dorel");
        
        
        
        hammer.provideEquipmentToUser("Dorel");
        M4A4.provideEquipmentToUser("Mohobi");
        M4A4.returnEquipmentToOffice();
        
        
        
        EquipmentController Artu = new EquipmentController();
        
        
        Artu.addEquipment(hammer);
        Artu.addEquipment(AKA47);
        Artu.addEquipment(M4A4); 
        Artu.addEquipment(Glock);
        Artu.addEquipment(spoon);
        Artu.addEquipment(Bazooka);
        Artu.addEquipment(Pc);
        Artu.addEquipment(Tele);
        List<Equipment> artillery = Artu.getEquipments();
        
        
        System.out.print(Artu.getNumberOfEquipments());
        
        System.out.println( "\n");
        
        List<Equipment>  Johny= Artu.findAllByOwner("Dorel");
        for(int i=0; i<Johny.size(); i++) {
            System.out.println(   Johny.get(i).getName() + " " + Johny.get(i).getSerialNumber() + " "
                                + Johny.get(i).getOwner() ); 
        }
        
        
        Map<String, List<Equipment>> Inventory= Artu.getEquipmentsGroupedByOwner();
        System.out.println(Inventory);
        
        
        
        Equipment Deli=Artu.removeEquipmentBySerialNumber("122few");   
        
        Equipment Beli=Artu.removeEquipmentBySerialNumber("SN123");
        
        System.out.println("\nThe list after Removing");
        for (int i=0; i<Artu.list.size(); i++)
            System.out.println(Artu.list.get(i).getName() + " " + Artu.list.get(i).getSerialNumber() + " "
                                + Artu.list.get(i).getOwner() ); 

    }
}
