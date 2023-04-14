package isp.lab5.exercise1;

import org.junit.Assert;
import org.junit.Test;

public class TestATM {
    Card c1 = new Card("12000","6000");
    Account a1 = new Account("Andruta",1000, c1);
    Bank bank = new Bank();

    ATM atm = new ATM(bank);
    
    @Test
    public void TestInsertCard(){
        atm.insertCard(c1, "6000");
        bank.addAccount(a1);
        Assert.assertEquals("Values should be 12000","12000","" + bank.account[0].getCard().getCardId());
        atm.withdraw(900);
        Assert.assertEquals("Values should be 100.0","100.0","" + bank.account[0].getBalance());
    }
    
    @Test
    public void TestcheckMoney(){
        atm.insertCard(c1, "6000");
        bank.addAccount(a1);
        atm.checkMoney();
        Assert.assertEquals("Values should be 1000.0","1000.0","" +bank.account[0].getBalance());
    }
    
    @Test
    public void TestWithdraw(){
        atm.insertCard(c1, "6000");
        bank.addAccount(a1);
        atm.withdraw(900);
        Assert.assertEquals("Values should be 100.0","100.0","" + bank.account[0].getBalance());
    }

    
    @Test
    public void TestRemoveCard(){
        atm.insertCard(c1, "6000");
        bank.addAccount(a1);
        atm.removeCard();
        Assert.assertEquals("Values should be null",null, atm.getCard());
    }
    
    @Test
    public void TestChangePin(){
        atm.insertCard(c1, "6000");
        bank.addAccount(a1);
        atm.changePin("6000","1111");
        Assert.assertEquals("Values should be '1111'","1111", bank.account[0].getCard().getPin());
    }
}
