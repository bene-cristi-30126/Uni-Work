package isp.lab6.exercise4;

import java.util.ArrayList;
import java.util.List;


//////////////////////////////////////////
abstract class Transaction{
    protected Account account;

    public Transaction(Account account) {
        this.account = account;
    }

    abstract String execute();
}

//////////////////////////////////////////
class Withdraw extends Transaction{
    private double amount;

    public Withdraw(int amount, Account account) {
        super(account);
        this.amount = amount;

    }

    public double getAmount() {
        return amount;
    }

    public String execute(){
        if(account.getBalance()>amount){
            account.setBalance(account.getBalance()-amount);
            System.out.println("Transaction executed");
        }
        return "EXECUTED!";
    }
}

class CheckMoney extends Transaction{
    
    public CheckMoney(Account account) {
        super(account);
    }
    
    public String execute(){
            System.out.println("Balance is: " + account.getBalance());
        return "EXECUTED!";
    }
}

class ChangePin extends Transaction{
    private String oldPin;
    private String newPin;

    public ChangePin(String newPin, String oldPin, Account account) {
        super(account);
        this.oldPin = oldPin;
        this.newPin = newPin;
    }
    
    public String execute(){
        if(account.getCard().getPin().equals(oldPin)){     
            account.getCard().setPin(newPin);
            System.out.println("Transaction executed");
        }
        else {
            System.out.println("Transaction NOT executed, wrong Pin");
        }
        return "EXECUTED!";
    }
}

//////////////////////////////////////////
class Card{
    private String cardId;
    private String pin;

    public Card(String cardId, String pin) {
        this.cardId = cardId;
        this.pin = pin;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }
}

//////////////////////////////////////////
class Account{
    private String owner;
    private double balance;
    private Card card;

    public Account(String owner, double balance, Card card) {
        this.owner = owner;
        this.balance = balance;
        this.card = card;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public Card getCard() {
        return card;
    }

    public void setCard(Card card) {
        this.card = card;
    }
}

//////////////////////////////////////////
class Bank{
    
    List<Account> list = new ArrayList<>();

    public void addAccount(Account a){
            list.add(a);
    }

    public void executeTransaction(Transaction t){
        t.execute();
    }

    public Account getAccountByCardId(String id){
        for(int i=0; i<10; i++){
            if(list.get(i).getCard().getCardId().equals(id)){
                return list.get(i);
            }
        }
        return null;
    }   
}

//////////////////////////////////////////
class ATM{
    private Bank bank;
    private Card card;

    public ATM(Bank bank) {
        this.bank = bank;
    }

    public Card getCard() {
        return card;
    }
    
    public void insertCard(Card c, String pin){
        if(card==null){
            if(c.getPin().equals(pin)){
                System.out.println("Card accepted.");
                card = c;
            }else{
                System.out.println("Pin is not valid.");
            }
        }else{
            System.out.println("Card already inserted");
        }
        
    }   

    public void removeCard(){
        this.card = null;
    }

    public void withdraw(int amount){
        if(card!=null){
            Account acc = bank.getAccountByCardId(card.getCardId());
            Withdraw tw = new Withdraw(amount, acc);
            bank.executeTransaction(tw);

        }else{
            System.out.println("No card present.");
        }
    }
    
    public void checkMoney() {
        if(card!=null){
            Account acc = bank.getAccountByCardId(card.getCardId());
            CheckMoney tw = new CheckMoney( acc);
            bank.executeTransaction(tw);

        }else{
            System.out.println("No card present.");
        }
    }
    
    public void changePin(String oldPin, String newPin) {
        if(card!=null){
            Account acc = bank.getAccountByCardId(card.getCardId());
            ChangePin tw = new ChangePin(newPin, oldPin, acc);
            bank.executeTransaction(tw);

        }else{
            System.out.println("No card present.");
        }
    }
}

//////////////////////////////////////////

public class Exercise4 {

    public static void main(String[] args) {
        Card c1 = new Card("12345","0000");
        Account a1 = new Account("Mihai",1000, c1);
        
        Card c2 = new Card("12305","0010");
        Account a2 = new Account("Mihail",2000, c2);
        
        Bank bank = new Bank();
        bank.addAccount(a1); bank.addAccount(a2);

        ATM atm = new ATM(bank);
        
        atm.insertCard(c1, "0000");
        atm.checkMoney();
        atm.withdraw(900);
        atm.checkMoney();
        
        atm.insertCard(c2, "0010");
        atm.removeCard();
        
        atm.insertCard(c2, "0010");
        atm.checkMoney();
        atm.withdraw(9000);
        atm.checkMoney();
        atm.changePin("0010", "1234");

    }
}

