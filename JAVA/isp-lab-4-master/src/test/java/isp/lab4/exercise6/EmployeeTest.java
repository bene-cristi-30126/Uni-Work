package isp.lab4.exercise6;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class EmployeeTest {
    
    Employee Cristina = new HourlyEmployee(100, 25);
    Employee Irina = new SalariedEmployee(100);
    Employee Anastasia = new ComissionEmployee(200, 15);
    
    @Test
    public void TestgetPaymentAmount(){
        assertEquals("Values should be '350.0'","350.0",""+ Cristina.getPaymentAmount());
        assertEquals("Values should be '100.0'","100.0",""+ Irina.getPaymentAmount());
        assertEquals("Values should be '215.0'","215.0",""+ Anastasia.getPaymentAmount());
    }
}
