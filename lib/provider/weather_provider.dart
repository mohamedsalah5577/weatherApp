import 'package:flutter/cupertino.dart';

import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  // WeatherProvider? weatherData;
  // WeatherProvider weatherData = WeatherProvider();
  set weatherData(WeatherModel weather) {
    weatherData = weather;
    // notifyListeners() >> tell any page using this data(weatherData) whatch out(انتبه) this data changing
    notifyListeners();
  }

  WeatherModel get weatherData => weatherData!;
}
