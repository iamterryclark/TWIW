class GetBg {
  String imageURL;
  int sceneNum;
  int fontSize;

  PImage scene;
  PFont polya;
  
  GetBg(String imageURL, int sceneNum) {
    this.imageURL = imageURL;
    this.sceneNum = sceneNum;
  }

  void run() {
    update();
  }

  void update() {
    scene = loadImage(imageURL);
    scene.resize(width, height);
  }

  void scene(String text1) {
    if (sceneNum == 0) {
      fontSize = 80;
    } else {
      fontSize = 130;
    }

    //Init Fonts
    polya = createFont("fonts/POLYA.ttf", fontSize);
    sky();
    image(scene, 0, 0);

    textFont(polya);
    fill(0);
    text(text1, width/2, 30);
  }

  void sky() {
    fill(133, 213, 246);
    rect(width/2, height/2, width, height);
  }
  
  void weatherCheck() {
    
  }
}