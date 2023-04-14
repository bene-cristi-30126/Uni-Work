package isp.lab9.exercise1;

import java.math.BigDecimal;
import java.util.Objects;
import lombok.Getter;
import lombok.Setter;
import yahoofinance.Stock;

public class UserPortofolio {
    @Getter @Setter
    private String name;
    @Getter @Setter
    private String symbol;
    @Getter @Setter
    private int quantity;
    @Getter @Setter
    private BigDecimal value;

    public UserPortofolio(Stock stock, String symbol, int quantity) {       
        this.value = stock.getQuote().getPrice().multiply(BigDecimal.valueOf(quantity));
        this.name = stock.getName();
        this.symbol = symbol;
        this.quantity = quantity;
    }

    @Override
    public int hashCode() {
        int hash = 4;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final UserPortofolio other = (UserPortofolio) obj;
        if (!Objects.equals(this.symbol, other.symbol)) {
            return false;
        }
        return true;
    }
}
