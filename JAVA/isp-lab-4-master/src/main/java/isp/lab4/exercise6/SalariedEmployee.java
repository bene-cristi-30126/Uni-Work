package isp.lab4.exercise6;

public class SalariedEmployee extends Employee {
    private double weeklySalary;

    public SalariedEmployee(double weeklySalary) {
        this.weeklySalary = weeklySalary;
    }
    
    public double getPaymentAmount(){
        return weeklySalary;
    }
}
