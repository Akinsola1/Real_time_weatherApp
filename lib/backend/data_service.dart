import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xiomi_weather_app/backend/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?q=abuja&appid=98e8dfcf4ea2319b693eb4c58b2a6018
    final queryParameter = {'q': city, 'appid': '7d6351b1a28a6bfc45ecf32517314790','units': "metric"};
    final uri =
        Uri.http('api.openweathermap.org', 'data/2.5/weather', queryParameter);

        final response = await http.get(uri);
        final json = jsonDecode(response.body);
        return WeatherResponse.fromJson(json);
  }
}
