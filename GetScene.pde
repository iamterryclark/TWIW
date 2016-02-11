//Built by Patricio, Terry and Andres

class GetScene {
  int fontSize;

  PImage scene;
  PImage sun;
  PImage moon;

  float angle = 0;

  float rotateSpeed = 1;
  int fade = 0;

  PFont polya;
  PFont textBoxFont;

  String[] bgimages = {
    "backgrounds/first-background.jpg", 
    "backgrounds/second-background.png", 
    "backgrounds/third-background.png", 
    "backgrounds/fourth-background.png", 
    "backgrounds/fifth-background.png", 
    "backgrounds/sixth-background.png", 
  };

  //For textBox on first page
  String myText = "";
  String location = "";

  GetScene() {
    sun = loadImage("backgrounds/sun&moon/sun.png");
    moon = loadImage("backgrounds/sun&moon/moon.png");
  }

  void scene(int sceneNum, String text1) {
    scene = loadImage(bgimages[stateNum]);
    scene.resize(width, height);

    //Due to size of the text, title screen is smaller thns.
    if (sceneNum == 0) {
      image(scene, 0, 0);
      fontSize = 80;
      //Font used for Title
      
      polya = createFont("fonts/POLYA.ttf", fontSize);
      textFont(polya);
      fill(0);
      text(text1, width/2+0.5, 33.5);
      text(text1, width/2, 34);
      text(text1, width/2-0.5, 34.5);
      

      //TEXT
      fill(0);
      noStroke();
      textBoxFont = createFont("Arial", 28);
      textFont(textBoxFont);
      text("TYPE A POSTCODE HERE (It's more reliable!)", width/2, height/2-70);

      //Text Box
      fill(255);
      rect(width/2, height/2, 700, 70);
      fill(0);
      text(myText, width/2, height/2);
    } else {
      fontSize = 130;
      //Sun needs to be drawn behind mountains background
      dayAndNight();
      //Font used for Title
      fill(255);
      polya = createFont("fonts/POLYA.ttf", fontSize);
      textFont(polya);
      text(text1, width/2-1, 31);
      text(text1, width/2, 29);
      text(text1, width/2+1, 30);
      image(scene, 0, 0);
      getChar.standStill();
    }

    if (!audioTrack[5].isPlaying()) {
      audioTrack[5].rewind();
      audioTrack[5].play();
      audioTrack[5].setGain(-15);
    }
  }


  void dayAndNight() {
    fill(fade/2, fade/2+30, fade+20);
    rect(0, 0, width*2, height*2);

    pushMatrix();
    translate(width/2, height/2);
    int radius = width/3;
    float charX = map(getChar.x, -width+50, width, -QUARTER_PI, TWO_PI);
    angle = charX;
    float x = radius * cos(angle);
    float y = radius * sin(angle);
    image(sun, x, y, 100, 100);
    
    if (angle > TWO_PI - QUARTER_PI) {
      image(moon, 300, -200, 100, 100);
    }

    if (angle > TWO_PI) {
      angle = -QUARTER_PI;
    }
    popMatrix();
  }
}