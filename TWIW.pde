//Team: Adam, Terry, Patricio, Andres, Bevis

import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;
import ddf.minim.*;
Minim minim;
AudioPlayer[] audioTrack;

int x; 
int y = height - 100;
int stateNum = 0;

//For textBox on first page
String myText = "";
String location = "";

//Initialise all Classes
GetWeather getWeather;
GameState gameState;
GetScene getScene;
GetChar getChar; 

void setup() {
  size(1024, 600);

  //Char Initial position
  getChar = new GetChar(0, height - height /4);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  getScene = new GetScene();

  minim = new Minim(this); // initialaizing minim object
  audioTrack = new AudioPlayer[6];
  for (int i=0; i < audioTrack.length; i++) {
    audioTrack[i] = minim.loadFile("sounds/"+i+".mp3"); // load file in audio player array loadFile ( "FILE NAME");
  }
}

void draw() {
  gameState = new GameState(stateNum);
  //GameState Init
  gameState.run();
}

void keyPressed() {

  //First Scene TextBox
  if (keyCode == BACKSPACE) {
    if (getScene.myText.length() > 0) {
      getScene.myText = getScene.myText.substring(0, getScene.myText.length()-1);
    }
  } else if (keyCode == DELETE) {
    getScene.myText = "";
  } else if (key == ENTER) {
    location = getScene.myText;
    getWeather = new GetWeather(location);
    while (location != "") {
      getWeather.run();
      location="";
    }
    stateNum = 1;
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    getScene.myText = getScene.myText + key;
  } 

  //Character Animation
  if (key == CODED) {
    if (keyCode == RIGHT) {     
      getChar.moveRight(); 
      getChar.x+=getChar.xSpeed;
      
      if (getChar.x <= 600) {
        getScene.fade += 4;
      } else if (getChar.x > 600) {
        getScene.fade -= 5;
      }
      
      if (getChar.x > width) {
        getChar.x = 0;
        stateNum += 1;
        getScene.fade = 0;
      }
    }

    if (keyCode == LEFT) {
      getChar.moveLeft(); 
      getChar.x -= getChar.xSpeed;
      
      if (getChar.x <= 600) {
        getScene.fade -= 4;
      } else if (getChar.x > 600) {
        getScene.fade += 5;
      }

      if (getChar.x <= 0) {
        getChar.x = width;
        stateNum -= 1;
      }
    }
    if (keyCode == UP) {
       getChar.jumpping();
       y+=getChar.gravity;
    } else {
      getChar.standStill();
    }
  }
}