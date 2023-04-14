package isp.lab3.exercise1;

public class Tree {
    private int height;
    //ALT + INSERT
    
    public Tree() {
        this.height =15;
    }

    public int getHeight() {
        return height;
    }  
    
    public void grow(int meters){
        if(meters>=1){
            this.height+=meters;
            System.out.println("New tree height is "+this.height);
        }
        else{
            System.out.println("Error:meet");
        }
    }

    @Override
    public String toString() {
        return ""+height;
    }
    
    
}
