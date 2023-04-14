package isp.lab10.exercise1;

import java.util.concurrent.TimeUnit;

public class Test{
    public static void main(String[] args) throws InterruptedException{
 
       int count = 0;
    for(;;)
        {
        try {
            Thread.sleep(1000);
            count ++;
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
       
    }
}
