package isp.lab3.exercise3;

import java.util.Objects;

public class Vechile {
    private static int counter=0;
    
    private String model;
    private String type;
    private int speed;
    private char fuelType;

    public Vechile(String model, String type, int speed, char fuelType) {
        this.model = model;
        this.type = type;
        this.speed = speed;
        this.fuelType = fuelType;
        counter++;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public void setFuelType(char fuelType) {
        this.fuelType = fuelType;
    }

    public String getModel() {
        return model;
    }

    public String getType() {
        return type;
    }

    public int getSpeed() {
        return speed;
    }

    public char getFuelType() {
        return fuelType;
    }

    @Override
    public String toString() {
        return ""+model + " (" + type + ") "+ speed + " fuel type " + fuelType;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 31 * hash + Objects.hashCode(this.model);
        hash = 31 * hash + Objects.hashCode(this.type);
        hash = 31 * hash + this.speed;
        hash = 31 * hash + this.fuelType;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Vechile other = (Vechile) obj;
        if (this.speed != other.speed) {
            return false;
        }
        if (this.fuelType != other.fuelType) {
            return false;
        }
        if (!Objects.equals(this.model, other.model)) {
            return false;
        }
        return Objects.equals(this.type, other.type);
    }   
    
}
