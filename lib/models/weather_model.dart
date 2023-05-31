// I Create this Model Because Saved Data Of Api

// // method 2
// class WeatherModel {
//   String? date;
//   double? temp;
//   double? maxTemp;
//   double? minTemp;
//   String? weatherStatName;

// method 2 this is a perfect
class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStatName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatName});

  factory WeatherModel.fromJason(dynamic data) {
    var jasonDataRout = data['forecast']['forecastday']['0']['day'];
    return WeatherModel(
      date: data['location']['localtime'],
      temp: jasonDataRout['avgtemp_c'],
      maxTemp: jasonDataRout['maxtemp_c'],
      minTemp: jasonDataRout['mintemp_c'],
      weatherStatName: jasonDataRout['condition']['text'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'temp = $temp, miniTemp = $minTemp, date = $date';
  }
}
