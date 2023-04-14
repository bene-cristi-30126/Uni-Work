/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package isp.lab9.exercise1;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.swing.table.AbstractTableModel;
import yahoofinance.Stock;
import yahoofinance.YahooFinance;

/**
 *
 * @author mihai.hulea
 */
public class Portofolio extends AbstractTableModel{
    

    private BigDecimal funds;
    private String[] columns = new String[] {"Name","Symbol", "Quanty", "Value"};
    private String[] symbols = new String[] {"INTC", "BABA", "TSLA", "AIR.PA", "MSFT", "AAPL"};  
    private ArrayList<UserPortofolio> UserStocks = new ArrayList<>();
    private Map<String, Stock> stocks = new HashMap<String, Stock>();

    public Portofolio(BigDecimal funds) {
        this.funds = funds;
    }
    
    public void Buy(String symbol, int quantity) throws IOException{
        stocks = YahooFinance.get(symbols);
        stocks.values().stream().forEach(s -> {
            if( s.getSymbol().equals(symbol))
                if( s.getQuote().getPrice().multiply(BigDecimal.valueOf(quantity)).intValue() <= funds.intValue() ) {
                    UserStocks.add(new UserPortofolio(s,symbol, quantity));
                    funds=funds.subtract(s.getQuote().getPrice().multiply(BigDecimal.valueOf(quantity)));
            }
        });
        this.fireTableDataChanged();
    }
    
    public void Sell(String symbol, int quantity) throws IOException{
        for(int i=0; i<=UserStocks.size(); i++){
            if( quantity <= UserStocks.get(i).getQuantity() 
                    && symbol.equals(UserStocks.get(i).getSymbol())){
                if(quantity == UserStocks.get(i).getQuantity() ){
                    UserStocks.remove(UserStocks.get(i));
                    funds = funds.add(UserStocks.get(i).getValue());
                }
                else {
                    UserStocks.get(i).setQuantity(UserStocks.get(i).getQuantity() - quantity);
                    funds = funds.add(UserStocks.get(i).getValue());
                }
            }
        }
    }

    public String[] getSymbols(){
         return symbols;
     }

    public BigDecimal getFunds() {
        return funds;
    }

    public void setFunds(BigDecimal funds) {
        this.funds = funds;
    }

    @Override
    public int getRowCount() {
        return stocks.size();
    }

    @Override
    public int getColumnCount() {
        return 4;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        UserPortofolio i = UserStocks.get(rowIndex);
        
        switch(columnIndex){
            case 0:return i.getName();
            case 1:return i.getSymbol();
            case 2:return i.getQuantity();
            case 3:return i.getValue();
        }
        return "N/A";
    }
    
    @Override
    public String getColumnName(int index) {
        return columns[index];
    }
}
