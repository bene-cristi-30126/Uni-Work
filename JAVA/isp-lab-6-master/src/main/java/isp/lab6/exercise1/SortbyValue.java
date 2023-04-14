
package isp.lab6.exercise1;
import java.util.Comparator;

public class SortbyValue implements Comparator<SensorReading> {

    @Override
    public int compare(SensorReading a, SensorReading b)
    {
 
        return a.getValue()-b.getValue();
    }
}
