
package isp.lab6.exercise1;
import java.util.Comparator;

public class SortbyLocation implements Comparator<SensorReading> {

    @Override
    public int compare(SensorReading a, SensorReading b)
    {
 
        return a.getLocation().compareTo(b.getLocation());
    }
}
