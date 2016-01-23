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

  StringList day = new StringList();
  StringList weather = new StringList();

  GetWeather(String location) {
    this.location = location; // location is passed into GetTemp Class
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
    println(windDir);
    
    //Weather and day
    for (int i = 0; i < forecast.size(); i++) {
      JSONObject weatherObj = forecast.getJSONObject(i); 
      String dayStr = weatherObj.getString("@day");
      String weatherStr = weatherObj.getString("@text");
      day.append(dayStr);
      weather.append(weatherStr);
      println(day.get(i), weather.get(i));
    }
    
    //Sunrise and Sunset Info
    SRhour = int(sunInfo.getString("@sunrise").substring(0, 1));
    SShour = int(sunInfo.getString("@sunset").substring(0, 1));
    println(SRhour, SShour);
  }

  //void ifWind() {
  //}

  //void ifSun() {
  //}

  //void ifRain() {
  //}

  //void ifCloud() {
  //}

  //void ifSnow() {
  //}
}