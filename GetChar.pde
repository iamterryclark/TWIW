class GetChar {
  int x, y;

  GetChar(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void run() {
    display();
  }

  void display() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, 10, 10);
  }
  
  void constrainChar(){
    if (gameState.stateNum == 5){
      if (x >= width - 20){
        x = width -20;
      } else {
      }
    
    }
  }

  
}