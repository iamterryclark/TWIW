import com.temboo.core.*;
import com.temboo.Library.Yahoo.Weather.*;

float x, x2, y ,y2;
int stateNum = 0;
//Initialise all Classes
GetWeather getWeather = new GetWeather("SE4");
GameState gameState = new GameState(stateNum);
BGImage bgimage = new BGImage("first-background.jpg", 0);

void setup() {
  size(1024, 600);
  
  //getWeather.run();
  
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw() { 
  gameState.run();
  
  fill(255,0,0);
  noStroke();

  //Character
  ellipse(x, height - height/4 + y, 10,10);
  
  //Sun
  ellipse(x2 + 100, height-100 + y2, 100,100);
}

void keyPressed(){
  if (key == CODED) {
   
    if (keyCode == RIGHT) {
      if (x >= width){
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