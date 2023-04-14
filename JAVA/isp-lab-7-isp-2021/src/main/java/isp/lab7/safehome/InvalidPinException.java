package isp.lab7.safehome;

public class InvalidPinException extends Exception{
    public InvalidPinException(String str)
    {
        super(str);
    }
}
