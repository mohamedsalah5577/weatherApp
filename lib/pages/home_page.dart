import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // listen >> tell this page by chang the data >> work update for home_page
    // listen:true >> by default
    weatherData = Provider.of<WeatherProvider>(context, /* listen:true*/).weatherData as WeatherModel?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF9000),
        title: Container(
          alignment: AlignmentDirectional.centerStart,
          child: Text('Weather App'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Icon(
                Icons.search,
                size: 28.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),

      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start\nsearching now 🔍',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  // Text(
                  //   'there is no weather 😔 start',
                  //   style: TextStyle(
                  //     fontSize: 28,
                  //   ),
                  // ),
                  // Text(
                  //   'searching now 🔍',
                  //   style: TextStyle(
                  //     fontSize: 28,
                  //   ),
                  // ),
                ],
              ),
            )
          : Container(
              color: Colors.orangeAccent,
              child: Column(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    'Cairo',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '12-8-2020',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/clear.png'),
                      Text(
                        weatherData!.weatherStatName,
                        // weatherData?.weatherStatName ??'', // ??'' >> if this data null >> skip and showing empty space
                        //body: weatherData == null << ما استعماتها بسسب انا عامل حسابي انها مش هتاخد قيمه فاضيه والا مش هيفتح
                        // 'Cairo',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text('maxTemp : 30'),
                          Text('minTemp : 30'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
