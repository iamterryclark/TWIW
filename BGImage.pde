class BGImage {
  String imageURL;
  int sceneNum;
  int listNum;
  PImage[] scene = new PImage[5];
  PFont polya;

  BGImage(String imageURL, int sceneNum) {
    this.imageURL = imageURL;
    this.sceneNum = sceneNum;
  }

  void run() {
    update();
  }

  void update() {
    scene[sceneNum] = loadImage(imageURL);
    scene[sceneNum].resize(width, height);
  }

  void scene0(String text1, String text2) {
    fill(255, 0, 0, 20);

    rect(30, 20, 100, width - 100, 7);
    image(scene[0], 0, 0);
    polya = createFont("POLYA.ttf", 150);
    textFont(polya);

    fill(0);
    text(text1, width/2, height/2-150);
    text(text2, width/2, height/2);
  }

  void scene1(String text1, String text2) {
    scene0(text1, text2);
  }

  void scene2(String text1, String text2) {
    scene0(text1, text2);
  }

  void scene3(String text1, String text2) {
    scene0(text1, text2);
  }

  void scene4(String text1, String text2) {
    scene0(text1, text2);
  }

  void scene5(String text1, String text2) {
    scene0(text1, text2);
  }
}