import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';


class WeatherService{
  Future <WeatherModel> fetchWeatherInformation (String cityName)async{
    const String apiKey = 'fcefa37b42bd4dbcc533f745f128cb0d';
    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'}, // read the api url to get data
    );

    http.Response response = await http.get(url); //fetch request

    if (response.statusCode == 200){
      return WeatherModel.fromJson(response.body); //show result
    } else{
      throw Exception('Failed to load weather information'); //error
    }
  }
}