package isp.lab5.exercise2;

interface Playable {
    void play();
}

class ColorVideo implements Playable {

    private String fileName;

    public ColorVideo(String fileName){
        this.fileName = fileName;
        loadFromDisk(fileName);
    }

    @Override
    public void play() {
        System.out.println("Play color video " + fileName);
    }

    private void loadFromDisk(String fileName){
        System.out.println("Loading video..." + fileName);
    }

    public String getFileName() {
        return fileName;
    }
    
    
}

class BlackandWhite implements Playable {
    
    private String fileName;
    
    public BlackandWhite(String fileName) {
        this.fileName = fileName;
    }
   
    @Override
    public void play() {
        System.out.println("Play black and white video " + fileName);
    }
    
    public String getFileName() {
        return fileName;
    }
    
    
}

class ProxyVideo implements Playable {

    private String fileName;
    private ColorVideo video;
    private BlackandWhite film;
    private String ColorType;

    public ProxyVideo(String fileName, String colorType){
            this.fileName = fileName;
            this.ColorType = colorType;
    }

    @Override
    public void play() {
        switch(ColorType) {
            case "Color":
                video = new ColorVideo(fileName);
                video.play();
                break;
            case "BlackandWhite":
                film = new BlackandWhite(fileName);
                film.play();
                break;
                
        }
    }
}

public class Exercise2 {
    
    public static void main(String[] args) {

        ProxyVideo Lucas = new ProxyVideo("Sparta", "Color");
        Lucas.play();

        ProxyVideo George = new ProxyVideo("Marta", "BlackandWhite");
        George.play();
        
    }
}
