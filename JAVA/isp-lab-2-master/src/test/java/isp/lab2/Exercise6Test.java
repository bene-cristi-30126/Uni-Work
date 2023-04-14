package isp.lab2;

import static org.junit.Assert.assertArrayEquals;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class Exercise6Test {
    int[] testVector = new int[]{1, 2, 2, 4, 8, 32, 256, 8192};

    @Test
    public void TestRecursive() {
        assertArrayEquals("For 8 elements the generated recursively vector should be " + testVector, testVector, Exercise6.generateRandomVectorRecursively(8));
    }

    @Test
    public void TestNonRecursive() {
        assertArrayEquals("For 8 elements the generated recursively vector should be " + testVector, testVector, Exercise6.generateVector(8));
    }
}
