package aut.utcluj.isp.ex4;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author stefan
 */
public class AirplaneTicketController {
    /**
     * Default number of tickets when a new instance is created
     */
    public static final int DEFAULT_NUMBER_OF_TICKETS = 10;
    private List<AirplaneTicket> tickets;

    /**
     * Generate default tickets
     */
    private void generateTickets() {
        for (int i = 0; i < DEFAULT_NUMBER_OF_TICKETS; i++) {
            String destination;
            Double price;

            if (i < 3) {
                destination = "Cluj-Napoca";
                price = 10d;
            } else if (i < 6) {
                destination = "Baia Mare";
                price = 20d;
            } else {
                destination = "Timisoara";
                price = 15d;
            }

            final AirplaneTicket airplaneTicket = new AirplaneTicket("ID-" + i, price, destination);
            airplaneTicket.setStatus(TicketStatus.NEW);

            tickets.add(airplaneTicket);
        }
    }

    public List<AirplaneTicket> getTickets() {
        return tickets;
    }

    /**
     * Get ticket details by ticket id
     *
     * @param ticketId - unique ticket id
     * @return
     * @apiNote: this method should throw {@link NoTicketAvailableException} exception if ticket not found
     */
    public AirplaneTicket getTicketDetails(final String ticketId) throws Exception  {
        boolean found = false; int position=0;
        try {
            for(int i=0; i<tickets.size(); i++)
                if(tickets.get(i).getId().equals(ticketId)){
                    found=true; position=i;
                }
            if(!found)
                throw new NoTicketAvailableException("No Ticket Available!");
        }catch(NoTicketAvailableException e) {
            System.out.println(e.getMessage());
        }  
        return tickets.get(position);
    }

    /**
     * Buy ticket with specific destination
     * Ticket information should be updated: customer name and status {@link TicketStatus#ACTIVE}
     *
     * @param destination - destination
     * @param customerId  - customer name
     * @return
     * @apiNote: this method should throw the following exceptions:
     * {@link NoDestinationAvailableException} - if destination not supported by AirplaneTicketController
     * {@link NoTicketAvailableException} - if destination exists but no ticket with NEW status available
     */
    public void buyTicket(final String destination, final String customerId) {
        boolean foundCustomer = false; int position=0;
        boolean foundDestination = false;
        boolean found=false;
        try {
            for(int i=0; i<tickets.size(); i++){
                if(tickets.get(i).getDestination().equals(destination))
                    foundDestination=true;
                if(tickets.get(i).getCustomerId().equals(customerId) )
                    foundCustomer=true;
                if(foundDestination==true && foundCustomer==true)
                    found = true;
            }
            if(!found)
                if(!foundDestination)
                    throw new NoDestinationAvailableException("No Destination Available!");
                if(!foundCustomer)
                    throw new NoTicketAvailableException("No Ticket Available!");  
        }
        catch(NoTicketAvailableException e) {
            System.out.println(e.getMessage());
        }
        catch(NoDestinationAvailableException e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * Cancel specific ticket
     * Status of the ticket should be set to {@link TicketStatus#CANCELED}
     *
     * @param ticketId - unique ticket id
     * @return
     * @apiNote: this method should throw the following exceptions:
     * {@link NoTicketAvailableException} - if ticket with this id does not exist
     * {@link TicketNotAssignedException} - if ticket is not assigned to any user
     */
    public void cancelTicket(final String ticketId) {
        boolean found=false; boolean assigned = true;
        try {
            for(int i=0; i<tickets.size(); i++){
                if(tickets.get(i).getId().equals(ticketId)){
                    tickets.get(i).setStatus(TicketStatus.CANCELED); found=true;
                }
                
                if(tickets.get(i).getStatus().equals(TicketStatus.NEW)){
                    assigned=false;
                }
            }
            if(!found)
                throw new NoTicketAvailableException("No Ticket Available!");
            if(!assigned)
                throw new TicketNotAssignedException(" Ticket Not Assigned!");
        }catch(NoTicketAvailableException | TicketNotAssignedException e) {
            System.out.println(e.getMessage());
        }  
    }

    /**
     * Change ticket customer name by specific ticket id
     *
     * @param ticketId   - unique ticket id
     * @param customerId - unique customer name
     * @return
     * @apiNote: this method should throw the following exceptions:
     * {@link NoTicketAvailableException} - if ticket with this id does not exist
     * {@link TicketNotAssignedException} - if ticket is not assigned to any user
     */
    public void changeTicketCustomerId(final String ticketId, final String customerId) {
        boolean found=false; boolean assigned = true;
        try {
            for(int i=0; i<tickets.size(); i++){
                if(tickets.get(i).getId().equals(ticketId)){
                    tickets.get(i).setCustomerId(customerId); found=true;
                }
                
                if(tickets.get(i).getStatus().equals(TicketStatus.NEW)){
                    assigned=false;
                }
            }
            if(!found)
                throw new NoTicketAvailableException("No Ticket Available!");
            if(!assigned)
                throw new TicketNotAssignedException(" Ticket Not Assigned!");
        }catch(NoTicketAvailableException | TicketNotAssignedException e) {
            System.out.println(e.getMessage());
        }  
    }

    /**
     * This method should filter all tickets by provided status.
     * An empty list should be returned if no tickets available with desired status
     *
     * @param status - ticket status
     * @return
     */
    public List<AirplaneTicket> filterTicketsByStatus(final TicketStatus status) {

        List<AirplaneTicket> avioane = new ArrayList<>();
        
        for(int i=0; i<tickets.size(); i++){
                if(tickets.get(i).getStatus().equals(status))
                    avioane.add(tickets.get(i));
                }
        return avioane;
    }

    /**
     * Return the tickets grouped by customer id
     *
     * @return dictionary where the key is the customer name and the value is a list of tickets for that customer
     * @apiNote: only tickets with available name should be returned
     */
    public Map<String, List<AirplaneTicket>> groupTicketsByCustomerId() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
