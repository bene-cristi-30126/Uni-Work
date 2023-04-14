package isp.lab6.exercise1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class SensorReadingList implements IReadingRepository {
    
    List<SensorReading> list = new ArrayList<>();

    @Override
    public void addReading(SensorReading reading) {
        list.add(new SensorReading(reading.getValue(), reading.getLocation(),
                                      reading.getType()));
    }

    @Override
    public double getAvarageValueByType(Type type, String location) {

        List<SensorReading> listAverage = new ArrayList<>();
        int counter=0;
        for(int j =0; j<list.size(); j++) {
            if(type.equals(list.get(j).getType()) && location.equals(list.get(j).getLocation())) {
                counter++; listAverage.add(list.get(j));
            }
        }
        int total=0;    
        for(int i = 0; i<counter; i++)
        total = total+listAverage.get(i).getValue();
        return total/counter;
    }
    
    @Override
    public List<SensorReading> getReadingsByType(Type type) {
        List<SensorReading> listByType = new ArrayList<>();
        
        for(int i =0; i<list.size(); i++) {
            if(type.equals(list.get(i).getType()))
                listByType.add(list.get(i));
        }
        return listByType;
}
    
    @Override
    public void listSortedByLocation(){
        Collections.sort(list, new SortbyLocation());

        System.out.println("\nSorted by Location");
        for (int i=0; i<list.size(); i++)
            System.out.println(list.get(i).getValue() + " " + list.get(i).getLocation() + " " + list.get(i).getType());
    
    }
    
    @Override
    public void listSortedByValue() {
        Collections.sort(list, new SortbyValue());

        System.out.println("\nSorted by value");
        for (int i=0; i<list.size(); i++)
            System.out.println(list.get(i).getValue() + " " + list.get(i).getLocation() + " " + list.get(i).getType());
    }
    
    @Override
    public List<SensorReading> findAllByLocationAndType(String location, Type type) {
     List<SensorReading> listByLocationandType = new ArrayList<>();
     for(int j =0; j<list.size(); j++) {
            if(type.equals(list.get(j).getType()) && location.equals(list.get(j).getLocation())) {
               listByLocationandType.add(list.get(j));
            }
        }
     return listByLocationandType;
    }
    
}

