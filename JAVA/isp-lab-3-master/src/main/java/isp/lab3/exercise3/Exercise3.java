package isp.lab3.exercise3;

public class Exercise3 {
    public static void main(String[] args) {
        Vechile car1 = new Vechile("Dacia", "Sandero",120,'D');
        Vechile car2 = new Vechile("Bayerische Motoren Werke", "Seria4", 200, 'D');
        
        System.out.println(car1.getType());
        System.out.println(car1.getModel());
        System.out.println(car1.getSpeed());
        System.out.println(car1.getFuelType());
        
        System.out.println(car2.getType());
        System.out.println(car2.getModel());
        System.out.println(car2.getSpeed());
        System.out.println(car2.getFuelType());
        
        car1.setType("Renault");
        car1.setModel("Duster");
        car1.setSpeed(125);
        car1.setFuelType('D');
        
        car2.setType("BMW");
        car1.setModel("M4");
        car1.setSpeed(225);
        car1.setFuelType('B');
        
        System.out.println(car1.getType());
        System.out.println(car1.getModel());
        System.out.println(car1.getSpeed());
        System.out.println(car1.getFuelType());
        
        System.out.println(car2.getType());
        System.out.println(car2.getModel());
        System.out.println(car2.getSpeed());
        System.out.println(car2.getFuelType());
        
        if(car1.equals(car2)){
            System.out.println("Equal cars");
        }
        else{
            System.out.println("NOt equal cars");
        }
    }
}
