//Built by Adam //<>// //<>//
class GetChar {
  float x, y;

  int jumpSpeed= 20;
  int gravity= 5;
  int drag= 1;
  int xSpeed= 4;
  int standingIndex;
  int jumpingIndex;
  int movingLeftIndex;
  int movingRightIndex;
  PImage duck;
  PImage[] jump= new PImage[4];
  PImage[] moveR= new PImage[5];
  PImage[] moveL= new PImage[5];
  PImage[] stand= new PImage[10];


  GetChar (float x, float y) {
    for (int i = 0; i < stand.length; i++) {
      stand[i] = loadImage ("fox/stand"+i+".png");
    }

    for (int i = 0; i < moveR.length; i++) {
      moveR[i] = loadImage ("fox/run"+i+".png");
    }

    for (int i = 0; i < moveL.length; i++) {
      moveL[i] = loadImage ("fox/away"+i+".png");
    }
    for (int i = 0; i < jump.length; i++) {
      jump[i] = loadImage ("fox/jump"+i+".png");
    }
    duck = loadImage("fox/duck0.png");
  }

  void standStill() {
    if (frameCount % 15 == 0) {
      standingIndex = int(random(0, stand.length));
    }
    image(stand[standingIndex], x, y);
  }

  void moveRight() {
    if (frameCount % 2 == 0) {
      movingRightIndex = int (random(0, moveR.length));
    }
    image(moveR[movingRightIndex], x, y+10);
  }
  
  void moveLeft() {
    if (frameCount % 2 == 0) {
      movingLeftIndex= int (random(0, moveL.length));
    }
    image(moveL[movingLeftIndex], x, y+10);
  }

  void jumpping() {
    if (frameCount % 20 == 0) {
      jumpingIndex= int (random(0, jump.length));
    }
    image(jump[jumpingIndex], x, y);
    jumpSpeed*= drag;
    y-=jumpSpeed;
  }
}