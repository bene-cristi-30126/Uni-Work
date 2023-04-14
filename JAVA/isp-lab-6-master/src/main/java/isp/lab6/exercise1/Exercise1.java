package isp.lab6.exercise1;

import java.util.List;

public class Exercise1 {
    public static void main(String[] args) {
        SensorReading Termo1= new SensorReading(17,"Cluj",Type.TEMPERATURE);
        SensorReading Termo2= new SensorReading(25,"Cluj",Type.TEMPERATURE);
        SensorReading Termo3= new SensorReading(20,"Cluj",Type.TEMPERATURE);
        SensorReading Humi= new SensorReading(100,"Deva",Type.HUMIDITY);
        SensorReading Piri= new SensorReading(2,"Alba",Type.PRESSURE);
        
        
        
        SensorReadingList John= new SensorReadingList();
        
        John.addReading(Termo1); John.addReading(Termo2); John.addReading(Termo3);
        John.addReading(Humi);
        John.addReading(Piri);
        
        System.out.println("Inital list:");
        
        for(int i=0;i<John.list.size();i++){
            System.out.println(John.list.get(i).getValue() + " " + John.list.get(i).getLocation() + " " + John.list.get(i).getType());
} 
        
        System.out.println("Average value of the list:");
        
        System.out.println(John.getAvarageValueByType(Type.TEMPERATURE, "Cluj"));
        
        
       
        System.out.println("List with common type:");
        
        List<SensorReading> listByType = John.getReadingsByType(Type.TEMPERATURE);
        
        for(int i=0;i<listByType.size();i++)
            System.out.println(John.list.get(i).getValue() + " " + John.list.get(i).getLocation() + " " + John.list.get(i).getType());
        
        
        John.listSortedByValue();
        
        
        John.listSortedByLocation();
        
        List<SensorReading> list2 = John.findAllByLocationAndType("Alba", Type.PRESSURE);
        for(int i=0;i<list2.size();i++)
            System.out.println(list2.get(i).getValue() + " " + list2.get(i).getLocation() + " " + list2.get(i).getType());
        

    }
}
