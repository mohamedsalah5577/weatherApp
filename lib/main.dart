import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  // WeatherModel? weather;

  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(  // بمجرد استخدامها يمكن لكل مستحدم ل :
      // Provider.of<WeatherProvider>(context).weatherData  >> يمكنه معلفه التغيير ويتعمل له update

      create: (context) {
        return WeatherProvider(); // provide data weather to all pages >> يبقا انا في الكلاس دا بوفر البيانات اللي محتاج اديهم للابناء
        //توفير لكل الصفحات ويمكن التعديل عليه من اي منهما
        // بمعني اخر (لما اقول return WeatherProvider)
        // معني كدا انه معايا في كل حته انا بستخدم فيها الprovider
      },
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
