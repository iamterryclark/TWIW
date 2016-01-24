class BGImage {
  String imageURL;
  int sceneNum;
  int listNum;
  PImage scene;
  PFont polya;

  BGImage(String imageURL, int sceneNum) {
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

  void scene0(String text1, String text2) {
    
    fill(255, 0, 0, 20);

    rect(width/2, height/2, width-100, height/2, 70);
    image(scene , 0, 0);
    
    if (sceneNum == 0){
      //scene.filter(INVERT);
    }
    
    polya = createFont("POLYA.ttf", 150);
    textFont(polya);
    textAlign(CENTER,CENTER);
    fill(0);
    text(text1, width/2, height/2-150);
    text(text2, width/2, height/2);
  }

  void scene1(String text1, String text2) {
    imageNum = 1;
    scene0(text1, text2);
  }

  void scene2(String text1, String text2) {
    imageNum = 2;
    scene0(text1, text2);
  }

  void scene3(String text1, String text2) {
    imageNum = 3;
    scene0(text1, text2);
  }

  void scene4(String text1, String text2) {
    imageNum = 4;
    scene0(text1, text2);
  }

  void scene5(String text1, String text2) {
    imageNum = 5;
    scene0(text1, text2);
  }
}