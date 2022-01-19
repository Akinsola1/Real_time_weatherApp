import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:xiomi_weather_app/backend/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // https://api.openweathermap.org/data/2.5/weather?q=abuja&appid=98e8dfcf4ea2319b693eb4c58b2a6018
    final queryParameter = {'q': city, 'appid': dotenv.get('API_key'),'units': "metric"};
    final uri =
        Uri.http('api.openweathermap.org', 'data/2.5/weather', queryParameter);

        final response = await http.get(uri);
        final json = jsonDecode(response.body);
        return WeatherResponse.fromJson(json);
  }
}
