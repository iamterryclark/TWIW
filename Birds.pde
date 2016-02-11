//Build Patricio and Terry

class Birds {
  PImage[] birdArray = new PImage[4];
  PImage bird, birdName; 
  int x;
  float animate;

  Birds() {
    PImage bird=loadImage("weather/sunny/birdSprite.png");
    int birdWidth = 190;
    for (int i = 0; i < 4; i++) {
      PImage birdName = bird.get(birdWidth * i, 0, birdWidth, bird.height);
      birdArray[i] = birdName;
    }
  }
  
  void display(){
    if (frameCount%4 == 0) {
      x++;
    }
    for (int i = 0; i < 10; i ++) {
      image(birdArray[x%4], 0 + animate,0);
      animate += 0.2;
    }
  }
}