//Built by Bevis
class GameState {
  int stateNum;

  GameState(int stateNum) {
    this.stateNum = stateNum;
  }

  void run() {
    update();
  }

  void update() {
    //Background Init
    if (stateNum < 0 || stateNum == 0) {
      getScene.scene(stateNum, "This week in weather");
    }

    switch(stateNum) {
    case 1:
      getScene.scene(stateNum, getWeather.dayList.get(0));
      getWeather.loadWeather();
      break;
    case 2:
      getScene.scene(stateNum, getWeather.dayList.get(1));
      getWeather.loadWeather();
      break;
    case 3:
      getScene.scene(stateNum, getWeather.dayList.get(2));
      getWeather.loadWeather();
      break;
    case 4:
      getScene.scene(stateNum, getWeather.dayList.get(3));
      getWeather.loadWeather();
      break;
    case 5:
      getScene.scene(stateNum, getWeather.dayList.get(4));
      getWeather.loadWeather();
      break;
    }

  }
}