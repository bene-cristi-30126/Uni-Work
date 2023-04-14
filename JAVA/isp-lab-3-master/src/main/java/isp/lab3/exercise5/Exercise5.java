package isp.lab3.exercise5;
import java.util.Scanner;
public class Exercise5 {
    public static void main(String[] args) {
        
        String[] Products = {"Juice", "Soda", "Crosaint", "Chips"};
        VendingMachine t1 = new VendingMachine(Products);
        
        Scanner scanOption = new Scanner(System.in);
                System.out.println("The option are: displayProducts, insertCoin, selectProduct, displayCredit");
                while(true){
                    String option = scanOption.nextLine();
                    t1.userMenu(option);
                }
    }
}
