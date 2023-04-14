package aut.utcluj.isp.ex4;

/**
 * @author stefan
 */
public class TicketNotAssignedException extends RuntimeException {
    public TicketNotAssignedException(String str)
    {
        super(str);
    }
}
