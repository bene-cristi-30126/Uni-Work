package isp.lab2;
import java.util.Scanner;
public class Exercise7 {

    /**
     * This method should generate a random number which
     * represent the position in the given arrays,so
     * the random should be between 0 and 7
     *
     * @return the generated random
     */
    public static int generateARandom() {
        int min=0;
        int max=7;
        
        int n=(int)Math.floor(Math.random()*(max-min+1)+min);
        return n;
    }

    public static void main(String[] args) {
        
        int MaxTries=5;
        int[] ucl = new int[]{1, 2, 3, 4, 5, 6, 7, 13};
        int[] answers = new int[]{10, 4, 2, 1, 2, 1, 1, 1};
        int times = generateARandom();
        int[] userTries=new int[MaxTries];
        
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number");
        int n1=sc.nextInt(), counter=0, tries;
        userTries[counter]=n1;
        
        if(n1==times){
            System.out.println("Bingo");
        }
         if(n1<times)
            System.out.println("too small");
        else
            System.out.println("too large");
        
        
         
         while(n1!=times && counter!=MaxTries){
            
            Scanner sc2=new Scanner(System.in);
            int n2=sc2.nextInt();
            userTries[counter+1]=n2;
            
            if(n2==times){
                System.out.println("Bingo");  break;
            }
            
            if(n2<times)
                System.out.println("too small");
            else
                System.out.println("too large");
            
            if(userTries[counter+1]!=userTries[counter])
                counter++;
            tries=MaxTries-counter;
            System.out.println("Number of tries left("+tries+")");
        }
    }
}
