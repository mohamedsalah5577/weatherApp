import 'package:flutter/cupertino.dart';

import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  set weatherData(WeatherModel weather) {
    weatherData = weather;
    notifyListeners();
  }

  WeatherModel get weatherData => weatherData!;
}
