package isp.lab7.safehome;

import static isp.lab7.safehome.ControllerInterface.MASTER_KEY;

public class SafeHome{

    public static void main(String[] args) throws Exception{
        
        DoorLockController Costel= new DoorLockController();
        
            Costel.addTenant("1111", "Fane");
            Costel.addTenant("321422", "Alejandro");
            Costel.addTenant("1242", "Alexia");
            Costel.addTenant("1232", "Fane");
            Costel.addTenant("1312", "Fane");
            
            
            
            
            /////////////////////////////////////TEst enterPin

            Costel.enterPin("321312"); 
            Costel.enterPin("14324"); System.out.println("The number of try is:" + Costel.getNumberofTries());
            Costel.enterPin("124"); System.out.println("The number of try is:" + Costel.getNumberofTries());
            Costel.enterPin("1111");  
            Costel.enterPin("1312");
            Costel.enterPin(MASTER_KEY); System.out.println("The number of try is:" + Costel.getNumberofTries());
            
            System.out.println(Costel.getDorel().getStatus()); 
            
            
            
            ////////////////////////////////////Test removePin
            
            System.out.println("\n" + Costel.getValidAccess());
            
            for(int i=0; i<Costel.getTenants().size(); i++) 
                System.out.println(Costel.getTenants().get(i).getName());

            System.out.println("\n"); 
            
            Costel.removeTenant("Alexia");
            
            Costel.removeTenant("Alexia");  System.out.println("\n"); 
            
            for(int i=0; i<Costel.getTenants().size(); i++) 
                System.out.println(Costel.getTenants().get(i).getName());
            
            ////////////////////////////////////Test GetAccessLog
            
            for(int i=0; i<Costel.getLogs().size(); i++) 
                System.out.println(Costel.getLogs().get(i).getTenantName() + ",   " + Costel.getLogs().get(i).getDateTime() + ",   " +
                                    Costel.getLogs().get(i).getOperation() + ",   " + Costel.getLogs().get(i).getDoorStatus() + ", "+ 
                                   Costel.getLogs().get(i).getErrorMessage());
            
    }
}
