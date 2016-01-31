import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;
import ddf.minim.*;

int x, y;
int stateNum = 0;
int imageNum = 0;

//For textBox on first page
String myText = "";
String location = "";

String[] bgimages = {
  "first-background.jpg", 
  "second-background.png", 
  "second-background.png", 
  "second-background.png", 
  "second-background.png", 
  "second-background.png", 
};

//Initialise all Classes
GetWeather getWeather;
GameState gameState = new GameState(stateNum);
GetBg getBg;
GetChar getChar;

void setup() {
  size(1024, 600);
  smooth();

  ellipseMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
}

void draw() {
  //Char Initial position
  getChar = new GetChar(x, height - height /4 + y);

  //Background Init
  getBg = new GetBg("backgrounds/" + bgimages[imageNum], stateNum);
  getBg.run();

  //GameState Init
  gameState.run();
  gameState.stateNum = stateNum;
}

void keyPressed() {

  //First Scene TextBox
  if (keyCode == BACKSPACE) {
    if (myText.length() > 0) {
      myText = myText.substring(0, myText.length()-1);
    }
  } else if (keyCode == DELETE) {
    myText = "";
  } else if (key == ENTER) {
    location = myText;
    getWeather = new GetWeather(location);
    
    while (location != "") {
      //getWeather.run();
      location="";
    }
    
   
    stateNum = 1;
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    myText = myText + key;
  } 
  
  //Character Animation

  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (x >= width) {

        //Player Init
        fill(255, 0, 0);
        noStroke();
        x = 0;
        stateNum += 1;
      } else {
        x += 100;
      }
    }

    if (keyCode == LEFT) {
      if (x <= 0) {
        x = width;
        stateNum -= 1;
      } else {
        x -= 100;
      }
    }
  }
}