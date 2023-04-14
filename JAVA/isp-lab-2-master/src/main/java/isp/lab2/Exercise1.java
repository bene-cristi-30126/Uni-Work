package isp.lab2;
import java.util.Scanner;
public class Exercise1 {

    /**
     * This method should generate an random number between 2 and 10 then
     * should ask user to enter that amount of numbers from keyboard and
     * store the numbers in an int array which should be returned
     *
     * @return the array of numbers read from keyboard
     */
    private static int[] getUserNumbers() {
        int min=2;
        int max=10;
        
        System.out.println("valore random de la"+min+"pana la "+max+":");
        int n=(int)Math.floor(Math.random()*(max-min+1)+min);
        System.out.println(n);
        Scanner sc=new Scanner(System.in);
        //n=sc.nextInt();
        System.out.println("Input vector elements ("+n+")");
        int[] userNumbers=new int[n];
        for(int i=0;i<n;i++)
        {
            userNumbers[i]=sc.nextInt();
        }
        return userNumbers;
    }

    /**
     * This method should compute the arithmetical mean of the given numbers
     *
     * @param userNumbers the numbers used to calculate the arithmetical mean
     * @return the arithmetical mean of the given numbers
     */
    protected static double computeTheArithmeticalMean(int[] userNumbers) {
        int i;
        double sum = 0, mean;
 
        for (i = 0; i < userNumbers.length; i++) {
            sum = sum + userNumbers[i];
        }
        mean = sum / userNumbers.length;
 
        return mean;
    }

    public static void main(String[] args) {
        int[] userNumbers = getUserNumbers();
        System.out.println("Mean number is: " + computeTheArithmeticalMean(userNumbers));
    }


}
