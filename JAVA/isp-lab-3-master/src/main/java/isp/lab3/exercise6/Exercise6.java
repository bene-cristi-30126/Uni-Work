package isp.lab3.exercise6;

import java.util.Scanner;
public class Exercise6 {
    public static void main(String[] args) {
        VendingMachine text = VendingMachine.getInstance();
        
        Scanner scanOption = new Scanner(System.in);
                System.out.println("The option are: displayProducts, insertCoin, selectProduct, displayCredit");
                while(true){
                    String option = scanOption.nextLine();
                    text.userMenu(option);
                }
    }
}
