package isp.lab3.exercise4;

public class Exercise4 {
    public static void main(String[] args) {
        MyPoint point1 = new MyPoint();
        MyPoint point2 = new MyPoint(1,0,0);
        
        System.out.println(point1.toString());
        System.out.println(point2.toString());
        
        point1.setXYZ(3,3,3);
        System.out.println(point1.toString());
        
        System.out.println(point2.distance(2,5,6));
        System.out.println(point2.distance(point1));
        
    }
}
