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

  // method 3 used >> factory (constructor his job mack object tak data of api)
  factory WeatherModel.fromJason(dynamic data) {
    // dynamic >> علشان لو عملتها (Map<String, dynamic>)
    // type بعدين يغير في api ما اضمن يمكن اللي عمل
    var jasonDataRout = data['forecast']['forecastday']['0']['day'];
    // (jasonDataRout) واستعملتها اختصارا (var) دي كانت متكرره فحطيتها في
    return WeatherModel(
      date: data['location']['localtime'],
      temp: jasonDataRout['avgtemp_c'],
      maxTemp: jasonDataRout['maxtemp_c'],
      minTemp: jasonDataRout['mintemp_c'],
      weatherStatName: jasonDataRout['condition']['text'],
    );

    // تابعه ل >> علي سبيل المثال
    // // ساعتها بقا ممكن اعمل return ليها هنا عادي بكل ( attribut, func, variable )  بتاعتها
    // // + >>  ( attribut, func, variable ) بتاعت اللي بترث منها
    // return WeatherChild(date: date,
    //     temp: temp,
    //     maxTemp: maxTemp,
    //     minTemp: minTemp,
    //     weatherStatName: weatherStatName);
  }

//let me >> تتيح لي
  // toString >> method let me print all data of object weather
  @override
  String toString() {
    // TODO: implement toString
    return 'temp = $temp, miniTemp = $minTemp, date = $date';
  }
}

// // من اقصل المميزات لل factory constructor
// // اني ممكت اعمل return لحاجه ترث من WeatherModel علي سبيل المثال :
//
// class WeatherChild extends WeatherModel {
//   WeatherChild({required String date,
//     required double temp,
//     required double maxTemp,
//     required double minTemp,
//     required String weatherStatName})
//       : super(
//       date: date,
//       temp: temp,
//       maxTemp: maxTemp,
//       minTemp: minTemp,
//       weatherStatName: weatherStatName);
// }

// // method 2  used >> named constructor
// WeatherModel.fromJason(dynamic data) {
//   var jasonData = data['forecast']['forecastday']['0']['avgtemp_c'];
//
//   date = data['location']['localtime'];
//   temp = jasonData['avgtemp_c'];
//   maxTemp = jasonData['maxtemp_c'];
//   minTemp = jasonData['mintemp_c'];
//   weatherStatName = jasonData['condition']['text'];
// }

// // method 1
// class WeatherModel {
//   final String date;
//   final double temp;
//   final double maxTemp;
//   final double minTemp;
//   final String weatherStatName;
//
//   WeatherModel(
//       {required this.date,
//         required this.temp,
//         required this.maxTemp,
//         required this.minTemp,
//         required this.weatherStatName});
// }
