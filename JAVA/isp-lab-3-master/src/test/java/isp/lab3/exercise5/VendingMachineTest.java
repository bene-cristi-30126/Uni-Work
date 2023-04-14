package isp.lab3.exercise5;

import org.junit.Assert;
import org.junit.Test;

public class VendingMachineTest {
    String[] Products = {"Pepsi", "Cola"};
    
    VendingMachine t1 = new VendingMachine(Products);
    @Test
    public void testDisplayProducts() {
        String[] products1 = t1.displayProducts();
        Assert.assertEquals( " has 2 words", 2, products1.length);
    }        
    @Test
    public void testDisplayCredit(){
        t1.insertCoin(5);
        Assert.assertEquals("Credit should be 5",5, t1.displayCredit());
        
    }
    @Test
    public void testSelectProduct(){
        Assert.assertEquals(" should be 'Cola'","Cola", t1.selectProduct(1));
        
    }
}
