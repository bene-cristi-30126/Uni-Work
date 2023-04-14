package isp.lab2;

import org.junit.Assert;
import org.junit.Test;

/**
 * Test class of Exercise2.
 *
 * @author Radu Miron
 */
public class Exercise2Test {
    @Test
    public void testSplitEnumerationIntoWords() {
        // TEST 1
        String enumeration1 = "car,test,pear";
        String[] words1 = Exercise2.splitEnumerationIntoWords(enumeration1);
        Assert.assertEquals(enumeration1 + " has 3 words", 3, words1.length);

        // TEST 2
        String enumeration2 = "car";
        String[] words2 = Exercise2.splitEnumerationIntoWords(enumeration2);
        Assert.assertEquals(enumeration2 + " has 1 word", 1, words2.length);
    }

    @Test
    public void testFindWordsStartingWith() {
        String[] words = {"phone", "computer", "apple", "car", "apricot", "compound"};

        // TEST 1:
        String[] results1 = Exercise2.findWordsStartingWith(words, 'a');
        Assert.assertEquals(2, results1.length);

        // TEST 2:
        String[] results2 = Exercise2.findWordsStartingWith(words, 'c');
        Assert.assertEquals(3, results2.length);

        // TEST 3:
        String[] results3 = Exercise2.findWordsStartingWith(words, 'z');
        Assert.assertEquals(0, results3.length);
    }
}
