package isp.lab4.exercise6;

public class Exercise6 {
    public static void main(String[] args) {

        Employee Dorel = new HourlyEmployee(100, 25);
        Employee Corel = new SalariedEmployee(100);
        Employee Costel = new ComissionEmployee(200, 15);

        System.out.println("Payment amount for Dorel  is " + Dorel.getPaymentAmount() );
        System.out.println("Payment amount for Corel  is " + Corel.getPaymentAmount() );
        System.out.println("Payment amount for Costel is " + Costel.getPaymentAmount() );
        
        Employee[] Intershiper = new Employee[6];
        Intershiper[0]= new HourlyEmployee(100, 10);
        Intershiper[1]= new HourlyEmployee(105, 20);
        
        Intershiper[2]= new SalariedEmployee(200);
        Intershiper[3]= new SalariedEmployee(150);
        
        Intershiper[4]= new ComissionEmployee(205, 25);
        Intershiper[5]= new ComissionEmployee(105, 25);
        
        double TotalPayment=0;
        for(int i=0;i<6;i++) {
            TotalPayment=TotalPayment+Intershiper[i].getPaymentAmount();
        }
        System.out.println("The total payment of the interns is: " + TotalPayment);
    }
}
