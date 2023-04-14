package isp.lab3.exercise4;

import java.lang.Math;

public class MyPoint {
    private int x;
    private int y;
    private int z;

    public MyPoint() {
        this.x=0; this.y=0; this.z=0;
    }

    public MyPoint(int x, int y, int z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
    
    public  void setXYZ(int x, int y, int z){
        this.x = x;
        this.y = y;
        this.z = z;
    }

    @Override
    public String toString() {
        return "" + "(" + x + ", " + y + ", " + z + ")";
    }
    
    public double distance(int x, int y, int z){
        return Math.sqrt( Math.pow(x-this.x,2) + Math.pow(y-this.y,2) + Math.pow(z-this.z,2));
    }
    
    public double distance(MyPoint another){      
        return Math.sqrt( Math.pow(another.x-this.x,2) + 
                          Math.pow(another.y-this.y,2) + Math.pow(another.z-this.z,2));
    }
    
    
    
    
}
