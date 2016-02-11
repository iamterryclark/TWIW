//Built by Terry (Weather Parser) and Patricio (Audio)
//Reference: https://temboo.com/library/Library/Yahoo/Weather/GetTemperature/

class GetWeather {

  // Create a session using your Temboo account application details
  TembooSession session = new TembooSession("tclar051", "myFirstApp", "fkKTzbxiSy07s7ZWPDmJZY80bz3zp0P3");

  // Set up some global values
  JSONObject results;

  int temp;
  int windDir;
  int SRhour;
  int SShour;
  
  String forecast;
  String location;
  String weatherOnDay;
  String weather;
  
  Birds birds;
  Clouds clouds;
  Rain rain;
  Snow snow;

  StringList dayList = new StringList();
  StringList weatherList = new StringList();

  GetWeather(String location) {
    this.location = location; // location is passed into GetTemp Class
    this.birds = new Birds();
    this.clouds = new Clouds();
    this.rain = new Rain();
    this.snow = new Snow();
  }

  void run() {
    runGetWeatherByAddressChoreo(); // Run the GetWeatherByAddress Choreo function
    getInfoFromJSON(); // Get the temperature from the JSON results
  }

  void runGetWeatherByAddressChoreo() {
    // Create the Choreo object using your Temboo session
    GetWeatherByAddress getWeatherByAddressChoreo = new GetWeatherByAddress(session);

    // Set inputs
    getWeatherByAddressChoreo.setResponseFormat("json");
    getWeatherByAddressChoreo.setAddress(location);
    getWeatherByAddressChoreo.setUnits("c");

    // Run the Choreo and store the results
    GetWeatherByAddressResultSet getWeatherByAddressResults = getWeatherByAddressChoreo.run(); 

    results = parseJSONObject(getWeatherByAddressResults.getResponse());
  }

  //Obtain values from JSON results
  void getInfoFromJSON() {
    //Get full JSON response

    JSONObject channel = results.getJSONObject("channel");

    //JSON object list
    JSONObject windInfo = channel.getJSONObject("yweather:wind");
    JSONObject sunInfo = channel.getJSONObject("yweather:astronomy");
    JSONArray forecast = channel.getJSONObject("item").getJSONArray("yweather:forecast");

    ////Collect Information
    //Wind info add
    windDir = windInfo.getInt("@direction");

    //Weather and day
    for (int i = 0; i < 5; i++) {
      JSONObject weatherObj = forecast.getJSONObject(i); 
      String dayStr = weatherObj.getString("@day");
      String weatherStr = weatherObj.getString("@text");
      dayList.append(dayStr);
      weatherList.append(weatherStr);
    }

    //Sunrise and Sunset Info
    SRhour = int(sunInfo.getString("@sunrise").substring(0, 1));
    SShour = int(sunInfo.getString("@sunset").substring(0, 1));
  }

  void rain() {
    rain.display();
  }

  void clouds() {
    clouds.display();
  }

  void birds() {
    birds.display();
  }

  void snow() {
    snow.display();
  }

  void loadWeather() {
    String[] thundery = {"thundery", "severe thunderstorms", "thunderstorms", "hurricane", "isolated thunderstorms", "scattered thunderstorms"};
    String[] snowRainy ={"snowRainy", "mixed rain and snow", "mixed rain and sleet", "mixed snow and sleet"};
    String[] rainy = {"rainy", "rain", "freezing drizzle", "drizzle", "freezing rain", "showers", "mixed rain and hail", "scattered showers", "pm showers"};
    String[] snowy = {"snowy", "snow flurries", "light snow showers", "blowing snow", "snow", "hail", "sleet", "heavy snow", "scattered snow showers", "heavy snow", "snow showers"};
    String[] windy = {"windy", "dust", "foggy", "haze", "smoky", "blustery", "wind", "cold" };
    String[] cloudy = {"cloudy", "tropical storm", "mostly cloudy", "mostly cloudy (night)", "mostly cloudy (day)", "partly cloudy (night)", "partly cloudy (day)", "partly cloudy"};
    String[] sunny = {"sunny", "mostly sunny", "clear (night)", "sunny", "fair (night)", "fair (day)", "hot"};
    String[] na = {"na", "not available", ""};
    String[][] stringyArrayy = {thundery, snowRainy, rainy, snowy, windy, cloudy, sunny, na};

    String weatherByDay = weatherList.get(stateNum-1);
    boolean moreThanTwo=false;
    println(weatherList);

    for (int i = 0; i < weatherByDay.length(); i++) {
      if (weatherByDay.charAt(i)=='/') {
        moreThanTwo = true;
      }
    }
    
    if (moreThanTwo) {
      String [] twoOfWeather = weatherByDay.split("/");
      weather = twoOfWeather[0].toLowerCase();
    } else if (!moreThanTwo) {
      String oneWeather = weatherByDay;
      weather = oneWeather.toLowerCase();
    }

    for (int i = 0; i < stringyArrayy.length; i++) {
      for (int j = 0; j < stringyArrayy[i].length; j++) {
        if (weather.equals(stringyArrayy[i][j])) {
          weatherOnDay = stringyArrayy[i][0];
        }
      }
    }
    
   // ------ Audio Loader ------ //

    //audiotrack[0] = thunder
    //audiotrack[1] = rain
    //audiotrack[2] = snow
    //audiotrack[3] = birds
    //audiotrack[4] = wind
    //audiotrack[5] = main theme song
    
 for (int i=0; i<audioTrack.length;i++) {
    if (!audioTrack[i].isPlaying()) {
        audioTrack[i].rewind();
      } 
  }
    if (weatherOnDay == "thundery") {
        clouds();
        audioTrack[0].play();
        audioTrack[7].setGain(-15);
        println("it's thundering");
    
    } else if (weatherOnDay == "snowRainy") {
          
          rain();
          audioTrack[1].play();
          snow();
          audioTrack[2].play();
        
      println("it's snowRaining!");
    } else if (weatherOnDay == "rainy") {
      rain();
      audioTrack[1].play();
      println("it's Raining!");
    } else if (weatherOnDay == "sunny") {
      birds();
      audioTrack[3].play();
       audioTrack[3].setGain(-10);
      println("it's sunny!");
    } else if (weatherOnDay == "snowy") {
      snow();
      audioTrack[2].play();
      println("it's snowy!");
    } else if (weatherOnDay == "windy") {
      audioTrack[4].play();
      audioTrack[4].setGain(-25);
      println("it's windy!");
    } else if (weatherOnDay == "cloudy") {
      clouds();
      println("it's cloudy!");
    } 
   
    else {
      println("wtf");
    }
  }
}