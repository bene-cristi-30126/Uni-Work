package isp.lab3.exercise2;

public class Exercise2 {
    public static void main(String[] args) {
        Rectangle s1 = new Rectangle(2,1);
        Rectangle s2 = new Rectangle(4,21,"green");
        
        System.out.println("The Color of the rectangle is   "+s1.getColor());
        System.out.println("The Length of the rectangle is  "+s1.getLength());
        System.out.println("The Width of the rectangle is   "+s1.getWidth());
        System.out.println("The Area of the rectangle is    "+s1.getArea());
        System.out.println("The Perimeter of the rectangle is  "+s1.getPerimeter());
        
        System.out.println("The Color of the rectangle is   "+s2.getColor());
        System.out.println("The Length of the rectangle is  "+s2.getLength());
        System.out.println("The Width of the rectangle is   "+s2.getWidth());
        System.out.println("The Area of the rectangle is    "+s2.getArea());
        System.out.println("The Perimeter of the rectangle is  "+s2.getPerimeter());
    }
}
