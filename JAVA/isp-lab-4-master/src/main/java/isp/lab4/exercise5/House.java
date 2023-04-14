package isp.lab4.exercise5;

public class House {
    private Controler Controler = new Controler();

    public Controler getControler() {
        return Controler;
    }
    
    public House(Controler Control){
        this.Controler = Control;
    }
    
}
