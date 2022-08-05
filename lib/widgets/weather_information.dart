import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel,Key? key}) : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.name,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Image.network('http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}.png',scale: 0.5,),
              const SizedBox(height: 50,width: 50,),
              Text(
                '${weatherModel.main.temp}',
                style: TextStyle(
                  fontSize: 20,
                ),),
              const SizedBox(height: 50,width: 50,),
              Column(
                children: [
                  const SizedBox(height: 10,width: 50,),
                  Text(
                    'max: ${weatherModel.main.tempMax}',
                    style: TextStyle(
                      fontSize: 14,
                    ),),const SizedBox(height: 10,width: 50,),
                  Text(
                    'min: ${weatherModel.main.tempMin}',
                    style: TextStyle(
                      fontSize: 14,
                    ),),
                ],
              ),
            ]
          ),

          const SizedBox(height: 50),
          Text('${weatherModel.weather.first.description}',
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),),
        ],

        )

    );
  }
}
