//Built by Patricio

class Rain {
  int[] speed;
  int[] pos;

  Rain() {
    speed = new int[600];
    pos = new int[600];
    for (int i = 0; i < 600; i++) {
      speed[i] = int(random(10, 20));
      pos[i] = int(random(-200, 600));
    }
  }

  void display() {
    translate(1250, 0);
    rotate(radians(115));
    for (int i = 0; i < 600; i++) {
      strokeWeight(0.2);
      stroke(255);
      line(pos[i], i*2, pos[i]+speed[i]*2, i*2);
      pos[i] += speed[i];
      pos[i] = pos[i] % width;
    }
  }
}