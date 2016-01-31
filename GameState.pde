class GameState {
  int stateNum;
  PFont textBoxFont; 

  GameState(int stateNum) {
    this.stateNum = stateNum;
  }

  void run() {
    update();
  }

  void update() {

    if (stateNum < 0 || stateNum == 0) {
      //Load background
      imageNum = 0;
      getBg.scene("This week in weather");

      //Select Character
      fill(60);
      noStroke();
      textBoxFont = createFont("Arial", 28);
      textFont(textBoxFont);
      
      //TEXT
      text("Select Character", width/2, 150); 
      
      //for (int i = 0; i < character.length; i ++){
        
      //}
      
      text("Type Location & Press Enter", width/2, height - 250);
      
      //Text Box
      fill(255);
      rect(width/2, height - 200, 500, 50);
      fill(0);
      text(myText, width/2, height - 205);
    }

    if (stateNum == 1) {
      imageNum = 1;
      getBg.scene(getWeather.day.get(0));
      getWeather.Cloud(3, 290, 101, width, 200);
      
      // String weatherByDay = getWeather.weather.get(0);
      //String [] byDay = weatherByDay.split("/");
      //getBg.weatherCheck();
      
      
    }

    if (stateNum == 2) {
      imageNum = 2;
      getBg.scene(getWeather.day.get(1));
    }

    if (stateNum == 3) {
      imageNum = 3;
      getBg.scene(getWeather.day.get(2));
    }

    if (stateNum == 4) {
      imageNum = 4;
      getBg.scene(getWeather.day.get(3));
    }

    if (stateNum == 5) {
      imageNum = 5;
      getBg.scene(getWeather.day.get(4));
      //getChar.constrainChar();
    }

    if (stateNum >= 1) {
      getChar.run();
    }
  }
}