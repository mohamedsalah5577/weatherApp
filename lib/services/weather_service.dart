import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '3677bed892474b30b7a122242220806';

// Future >> يعني حاجه جايه في المستقبل
  // فالطبيعي اني اقول (async) يعني استني الحاجه اللي جايه دي
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = // url >> object of Uri
        Uri.parse('$baseUrl/current.jason?key=$apiKey&q=$cityName&days=7');
    // parse >> convert the string of object(of class Uri) to url of object(of class Uri)

    //   كان بالشكل دا
    // Uri.parse('http://api.weatherapi.com/v1/current.jason?key=3677bed892474b30b7a122242220806&q=London&aqi=no');

    // get >> func take object(url) of class Uri
    // وانزل تحت عند الحاجه اللي جايه اقول (await)

    // http. >> used assume forget class Response OR any other class, func...
    // http.Response response >> Saved this data of the location(response)
    http.Response response = await http.get(url);

    // Map<String, dynamic> >> type of data takes of jason api
    // Map >> type jason data , String >> type key map
    // dynamic >> type value key , (response.body) >> content of body jason data
    // jsonDecode >> convert the jason data of api to String can be using in app

    Map<String, dynamic> data = jsonDecode(response.body);
    // OR >> dynamic data = jsonDecode(response.body);

    // // method 3
    WeatherModel weather = WeatherModel.fromJason(data);
    return weather;

    // // method 2
    // WeatherModel weather = WeatherModel.fromJason(data);
    // return weather;

    // // method 1
    // var jasonData= data['forecast']['forecastday']['0']['avgtemp_c'];
    //
    //
    // WeatherModel weather = WeatherModel
    //   (
    //     date: data['location']['localtime'],
    //     temp: jasonData['avgtemp_c'],
    //     maxTemp: jasonData['maxtemp_c'],
    //     minTemp: jasonData['mintemp_c'],
    //     weatherStatName: jasonData['condition']['text'],
    // );
  }
}
