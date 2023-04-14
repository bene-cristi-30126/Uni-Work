package isp.lab3.exercise6;
import java.util.Scanner;
public final class VendingMachine {
    
    private static volatile VendingMachine instance;
    private int[] id;
    private int credit=0;
    private String[] Products= {"Juice", "Soda", "Crosaint", "Chips"}; ;

    public static VendingMachine getInstance() {
        if (instance == null) {
            synchronized (VendingMachine.class) {
                if (instance == null) {
                    instance = new VendingMachine();
                }
            }
        }
        return instance;
    }

    private VendingMachine() {}
    
    public void setId(String[] Products) {
        for(int i=0;i<Products.length;i++){
            this.id[i]=i;
        }
        
    }
    public String[] displayProducts(){
        for(int i=0;i<Products.length;i++){
            System.out.println(""+ Products[i] + ", id: " + i );
        }
        return Products;
    }

    public void insertCoin(int value) {
        this.credit += value;
    }

    public String selectProduct(int id) {
        if(id<=Products.length){
            System.out.println(Products[id]);
        }
        else{
            System.out.println("Error, Try other id!");
        }
        return Products[id];
    }

    public int displayCredit() {
        System.out.println(credit);
        return credit;
    }
    
    public void userMenu(String option){
        switch(option) {
            case "displayProducts":
              Products=displayProducts();
              break;
            case "insertCoin":
              Scanner scanCoin = new Scanner(System.in);
                System.out.println("Insert value of the product");
                int valoare = scanCoin.nextInt();
                insertCoin(valoare);
              break;
            case "selectProduct":
              Scanner scanId = new Scanner(System.in);
                System.out.println("Insert id of the product");
                int num = scanId.nextInt();
                Products[num]=selectProduct(num);
              break;
            case "displayCredit":
              credit=displayCredit();
              break;
            case "Exit":
              System.out.println("Good Bye!");
              break;
            default:
              System.out.println("Error, Try other option!");
          }
    }  
}
