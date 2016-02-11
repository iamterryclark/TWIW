//Turned into a class by Terry for completeness of the program
//Refernce: http://solemone.de/demos/snow-effect-processing/

class Snow {
  int amount = 300; 
  PVector[] pos = new PVector[amount];
  int[] flakeSize = new int[amount];
  int [] dir = new int[amount];
  int minFlakeSize = 1;
  int maxFlakeSize = 5;

  Snow() {
    for (int i =0; i < amount; i ++) {
      flakeSize[i] =  round(random(minFlakeSize, maxFlakeSize));
      pos[i] = new PVector(random(0, width),random(0, height));
      dir[i] = round(random(-1, 1));
    }
  }

  void display() {

      fill(255);
      for (int i =0; i < pos.length; i ++) {
        ellipse(pos[i].x, pos[i].y, flakeSize[i], flakeSize[i]);

      if (dir[i] == 0) {
        pos[i].x += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
      } else {
        pos[i].y -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
      }

      pos[i].y += flakeSize[i] + dir[i]; 

      if (pos[i].x > width + flakeSize[i] || pos[i].x < -flakeSize[i] || pos[i].y > height + flakeSize[i]) {
        pos[i].x = random(0, width);
        pos[i].y = -flakeSize[i];
      }
    }
  }
}