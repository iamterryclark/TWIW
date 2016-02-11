//Built by Terry

class Clouds {
  int[] cloudNum;
  float[] speed;
  int[] pos;
  PImage[] clouds;
  
  Clouds () {
    clouds = new PImage[3];
    clouds[0] = loadImage("weather/clouds/clouds1.png");
    clouds[1] = loadImage("weather/clouds/clouds2.png");
    clouds[2] = loadImage("weather/clouds/clouds3.png");
    cloudNum = new int[5];
    speed = new float[5];
    pos = new int[5];
    
    for (int i = 0; i < 5; i ++) {
      cloudNum[i] = (int)random(0,3);
      speed[i] = random(0.02,0.04);
      pos[i] = (int)random(0, width); 
    }
  }

  void display() {
    for (int i = 0; i < 5; i ++){
      image(clouds[cloudNum[i]], pos[i], (i+i) * 2);
    }
  }
}