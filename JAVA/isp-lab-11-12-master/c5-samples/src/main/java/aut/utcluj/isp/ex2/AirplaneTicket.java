package aut.utcluj.isp.ex2;

/**
 * @author stefan
 */
public class AirplaneTicket {
    private String id;
    private Double price;
    private String destination;
    private String customerName;

    public AirplaneTicket(String id, String customerName, Double price, String destination) {
        this.id = id;
        this.price = price;
        this.customerName = customerName;
        this.destination=destination;
    }

    public String getDestination() {
        return destination;
    }
    
}
