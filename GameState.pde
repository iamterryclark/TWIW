class GameState {
  int stateNum;

  GameState(int stateNum) {
    this.stateNum = stateNum;
  }

  void run() {
    update();
    println(stateNum);
  }

  void update() {
    if (stateNum < 0) {
      stateNum = 1;
      imageNum = 0;
      bgimage.scene0("This week", "in weather");
    }
    
    if (stateNum == 0) {
      imageNum = 0;
      bgimage.scene0("This week", "in weather");
    }
    
    if (stateNum == 1) {
      imageNum = 1;
      bgimage.scene1("Scene", "1");
    }
    
    if (stateNum == 2) {
      imageNum = 2;
      bgimage.scene2("Scene", "2");
    }
    
    if (stateNum == 3) {
      imageNum = 3;
      bgimage.scene3("Scene", "3");
    }
    
    if (stateNum == 4) {
      imageNum = 4;
      bgimage.scene4("Scene", "4");
    }
    
    if (stateNum == 5) {
      imageNum = 5;
      bgimage.scene5("Scene", "5");
    }
    
    if (stateNum >= 5) {
      imageNum = 5;
      bgimage.scene5("Scene", "5");
    }
  }
}