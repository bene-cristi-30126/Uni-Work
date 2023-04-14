package isp.lab7.safehome;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DoorLockController implements ControllerInterface{
    
    private final Door Dorel = new Door(DoorStatus.CLOSE);
    private int NumberofTries=0;
    
    private final List<AccessKey> AccessKeys = new ArrayList<>();
    private final List<Tenant> Tenants = new ArrayList<>();
    private final List<AccessLog> AccessLogs = new ArrayList<>();
    private final Map<Tenant,AccessKey> validAccess = new HashMap<>();         
    
    public boolean ValidPin(String pin){
        boolean valided=false;
        for(int i=0; i<AccessKeys.size(); i++) 
                        if(pin.equals(AccessKeys.get(i).getPin())) 
                            valided=true;
        return valided;
    }
    
    @Override
    public DoorStatus enterPin(String pin) throws Exception {
        
        boolean valided=ValidPin(pin);
        String operation="Locking Door";
        String error="Succesful";
        
        if(pin.equals(MASTER_KEY)){
            NumberofTries=0;
            if(Dorel.getStatus().equals(DoorStatus.OPEN))
                Dorel.lockDoor();  
            else {
                Dorel.unlockDoor(); operation="Unlocking Door";
            }
            return Dorel.getStatus();
        }
        
        try {
            if(NumberofTries<3) {
                try {
                    if(valided){
                        if(Dorel.getStatus().equals(DoorStatus.OPEN))
                                Dorel.lockDoor();  
                            else {
                                Dorel.unlockDoor(); operation="Unlocking Door";
                            }
                    }
                    else {
                        NumberofTries++;
                        error="Wrong Pin";
                        throw new InvalidPinException("Wrong Pin!");
                        }  
                } 
                catch(InvalidPinException i) {
                    System.out.println(i.getMessage());
                }
            }
            else {
                error="Too Many Attempts!";    
                throw new TooManyAttemptsException("Too Many Attempts!");
            }
        }   
        catch(TooManyAttemptsException e) {
                System.out.println(e.getMessage());
            }
        finally {
            AccessLogs.add(new AccessLog("Unknown", LocalDateTime.now(), operation, Dorel.getStatus(), error));
        }
        return Dorel.getStatus();
    }

    
    
    @Override
    public void addTenant(String pin, String name) throws Exception {
        boolean found=false;
        String error="Tenant Already exists!";
             try {
                    for(int i=0; i<Tenants.size(); i++) {  
                        if(Tenants.get(i).getName().equals(name)) {
                            found=true;
                            throw new TenantAlreadyExistsException("Tenant Already exists!");
                        }   
                    }
            }
            catch(TenantAlreadyExistsException e) {
                System.out.println(e.getMessage());
                }
            finally {
                 if(found)
                     AccessLogs.add(new AccessLog(name, LocalDateTime.now(),"AddingTenant", Dorel.getStatus(), error));
                 else
                     AccessLogs.add(new AccessLog(name, LocalDateTime.now(),"AddingTenant", Dorel.getStatus(), "Succesful"));
             }
            if(found==false){
                Tenants.add(new Tenant(name));
                AccessKeys.add(new AccessKey(pin));
                validAccess.put(new Tenant(name), new AccessKey(pin));
            }

    }

    
    
    @Override
    public void removeTenant(String name) throws Exception {
        boolean found=false;
        int position=0;
        String error="Tenant Not Found!!";
        try {
            for(int i=0; i<Tenants.size(); i++)
                if(Tenants.get(i).getName().equals(name)){
                    found=true; position=i;
                }
            if(!found)
                throw new TenantNotFoundException("Tenant Not Found!");
            else
                Tenants.remove(Tenants.get(position));
        }catch(TenantNotFoundException e) {
            System.out.println(e.getMessage());
        }
        finally {
            if(found)
                     AccessLogs.add(new AccessLog(name, LocalDateTime.now(),"RemoveingTenant", Dorel.getStatus(), error));
                 else
                     AccessLogs.add(new AccessLog(name, LocalDateTime.now(),"RemoveingTenant", Dorel.getStatus(), "Succesful"));
        }
    }

    
    
    public List<AccessLog> getLogs() {
        return AccessLogs;
    }   

    public int getNumberofTries() {
        return NumberofTries;
    }

    public Door getDorel() {
        return Dorel;
    }

    public List<Tenant> getTenants() {
        return Tenants;
    }

    public Map<Tenant, AccessKey> getValidAccess() {
        return validAccess;
    }
    
    
}
