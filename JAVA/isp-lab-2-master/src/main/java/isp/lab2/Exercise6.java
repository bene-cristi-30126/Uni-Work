package isp.lab2;
import java.util.Scanner;

public class Exercise6 {

    /**
     * This method should generate the required vector non-recursively
     *
     * @param n the length of teh generated vector
     * @return the generated vector
     */
    public static int[] generateVector(int n) {
        int vector[]= new int[n];
        vector[0]=1;
        vector[1]=2;
        for(int i=2; i<n;i++){
            vector[i]=vector[i-1]*vector[i-2];
        }
            return vector;
    }

    /**
     * This method should generate the required vector recursively
     *
     * @param n the length of teh generated vector
     * @return the generated vector
     */
    public static int[] generateRandomVectorRecursively(int n) {
        int[] generateRandomVectorRecursively = new int[n+1];
        generateRandomVectorRecursively[0] = 1;
        generateRandomVectorRecursively[1] = 2;
        generateRandomVectorRecursively[n]=generateRandomVectorRecursively[n-2]*generateRandomVectorRecursively[n-1];

        if(n<=1)
            return generateRandomVectorRecursively(n);
        return generateRandomVectorRecursively(n+1);
        
    }

    public static void main(String[] args) {
        // TODO: print the vectors
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of elements");
        int n=sc.nextInt();
        int[] vector1= new int[n];
                vector1=generateVector(n);

        for(int i=0; i<n;i++)
                    System.out.println(vector1[i] +",");
        
        //int[] vector2= new int[n];
                //vector2=generateRandomVectorRecursively(n);

        //for(int i=0; i<n;i++)
                    //System.out.println(vector2[i] +",");
        
        
        
    }
}
