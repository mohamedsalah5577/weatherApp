import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

import '../provider/weather_provider.dart';


class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF9000),
        title: Container(
          alignment: AlignmentDirectional.centerStart,
          child: Text('Search a City'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              // print(weather.temp);

              // access data on provider to object :
              // Provider.of<WeatherModel>(context).date = weather.date;
              // listen >> tell this page by chang the data
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              // استحدمه لما اكون التطبيق عرب انجليزي
              // contentPadding: EdgeInsetsDirectional.all(27),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 18, vertical: 25),
              label: Text('search'),
              hintText: 'Enter a city',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
