package isp.lab2;
import java.lang.Math;
public class Exercise3 {

    /**
     * This method should verify if a number is prime
     *
     * @param number the number to check
     * @return true if number is prime and false otherwise
     */
    public static boolean isPrimeNumber(final int number) {
        int[] PrimeNumbers = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199};
        for(int i=0; i<PrimeNumbers.length;i++){
            if(number == PrimeNumbers[i]){
                return true;
            }   
        }
        return false;
    }

    /**
     * This method should calculate the sum of digits of a given number
     *
     * @param number the number used to calculate the sum of digits
     * @return an int representing the sum of digits of the given number
     */
    public static int calculateSumOfDigits(int number) {
        int  digit, sum = 0;  
        while(number > 0)  
        {  
            digit = number % 10;  
            sum = sum + digit;  
            number = number / 10;  
        }  
        return sum;
    }

    /**
     * This method should extract the prime numbers from a given interval
     * using isPrimeNumber(final int number) method defined above
     * NOTE* a < b
     *
     * @param a the left end of the interval
     * @param b the right end of the interval
     * @return and int array consisting of the prime numbers from the given interval
     */
    public static int[] getPrimeNumbersFromInterval(int a, int b) {
        // TODO: Use isPrimeNumber(final int number)
        int counter=0;
        for(int i=a; i<=b;i++){
            if(isPrimeNumber(i)){
                counter++;
            }
        }
        int[] ThePrimeFromInterval = new int[counter];
        for(int i=a; i<=b;i++){
            for(int j=0; j<counter; j++){
                if(isPrimeNumber(i)){
                    ThePrimeFromInterval[j] =i;
                }
            }
        }
        
        return ThePrimeFromInterval;
    }

    /**
     * This method should calculate the geometric mean of the given prime numbers
     *
     * @param primeNumbers the numbers used to calculate the geometric mean
     * @return the geometric mean of the given numbers
     */
    public static double calculateGeometricMean(int[] primeNumbers) {
        double sum = 1;
        for(int i=1; i<primeNumbers.length;i++){
            sum=sum*primeNumbers[i];
        }
        return Math.pow(sum, 1.0 /(double) primeNumbers.length);
    }

    /**
     * This method should calculate the number of prime numbers which
     * have the sum of digits an even number
     * NOTE* use calculateSumOfDigits(int number)
     *
     * @param primeNumbers prime numbers used for calculation
     * @return the numbers which respect the given condition
     */
    public static int numberOfPNWithEvenSumOfDigits(int[] primeNumbers) {
        // TODO: Use calculateSumOfDigits(int number)
        int counter=0;
        for(int i=0; i<primeNumbers.length;i++){
            if(calculateSumOfDigits(i)%2 == 0){
                counter++;
            }
        }
        return counter;
    }

    public static void main(String[] args) {
        int a = 0;
        int b = 0;
        System.out.println("The geometric mean is: " + calculateGeometricMean(getPrimeNumbersFromInterval(a, b)));
        System.out.println("The number of prime numbers which have the sum of digits an even number is: " + numberOfPNWithEvenSumOfDigits(getPrimeNumbersFromInterval(a, b)));
    }
}
