// ignore_for_file: public_member_api_docs, sort_constructors_first
class TemparatureInfo {
  final double temparature;
  final int humidity;
  final double feelsLike;
  final int pressure;
  TemparatureInfo({
    required this.temparature,
    required this.humidity,
    required this.feelsLike,
    required this.pressure,
  });
  factory TemparatureInfo.fromJson(Map<String, dynamic> json) {
    final temprature = json['temp'];
    final humidity = json['humidity'];
    final feelsLike = json['feels_like'];
    final pressure = json['pressure'];
    return TemparatureInfo(
        temparature: temprature,
        humidity: humidity,
        feelsLike: feelsLike,
        pressure: pressure);
  }
}

class CountrySys {
  final String country;

  CountrySys({
    required this.country,
  });
  factory CountrySys.fromJson(Map<String, dynamic> json) {
    final country = json['country'];
    return CountrySys(country: country);
  }
}

class Wind {
  final double speed;
  Wind({
    required this.speed,
  });
  factory Wind.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    return Wind(speed: speed);
  }
}

class WeatherInfo {
  final String description;
  final String icon;
  WeatherInfo({
    required this.description,
    required this.icon,
  });
  factory WeatherInfo.froomJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class WeatherResponse {
  final String cityName;
  final TemparatureInfo tempInfo;
  final WeatherInfo weatherInfo;
  final CountrySys countrySys;
  final Wind wind;

  String get iconurl {
    var response =
        'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
    switch (response) {
      // clear sky day
      case 'https://openweathermap.org/img/wn/01d@2x.png':
        return "assets/images/clear_Sky_day.png";
      // clear sky night
      case 'https://openweathermap.org/img/wn/01n@2x.png':
        return "assets/images/clear_sky_night-removebg-preview.png";
      //few cloud day
      case 'https://openweathermap.org/img/wn/02d@2x.png':
        return "assets/images/few_cloud.png";
      // few cloud night
      case 'https://openweathermap.org/img/wn/02n@2x.png':
        return "assets/images/few_cloud_night-removebg-preview.png";
      // scattered cloud day
      case 'https://openweathermap.org/img/wn/03d@2x.png':
        return "assets/images/scattered_cloud_day-removebg-preview.png";
      //scattered cloud night
      case 'https://openweathermap.org/img/wn/03n@2x.png':
        return "assets/images/scattered_cloud_night-removebg-preview.png";
      // broken cloud day
      case 'https://openweathermap.org/img/wn/04d@2x.png':
        return "assets/images/overcast_cloud-removebg-preview.png";
      // broken cloud night
      case 'https://openweathermap.org/img/wn/04n@2x.png':
        return "assets/images/overcast_cloud-removebg-preview.png";
      //shower rain day
      case 'https://openweathermap.org/img/wn/09d@2x.png':
        return "assets/images/shower_rain.png";
      //shower rain night
      case 'https://openweathermap.org/img/wn/09n@2x.png':
        return "assets/images/shower_rain_night-removebg-preview.png";
      //rain day
      case 'https://openweathermap.org/img/wn/10d@2x.png':
        return "assets/images/rain.png";
      //rain night
      case 'https://openweathermap.org/img/wn/10n@2x.png':
        return "assets/images/rain.png";
      //thunderstorm day
      case 'https://openweathermap.org/img/wn/11d@2x.png':
        return "assets/images/thunderstorm.png";
      //thunderstorm night
      case 'https://openweathermap.org/img/wn/11n@2x.png':
        return "assets/images/thunderstorm.png";
      //snow day
      case 'https://openweathermap.org/img/wn/13d@2x.png':
        return "assets/images/snow.png";
      //snow night
      case 'https://openweathermap.org/img/wn/13n@2x.png':
        return "assets/images/snow.png";
      //mist day
      case 'https://openweathermap.org/img/wn/50d@2x.png':
        return "assets/images/mist.png";
      //mist night
      case 'https://openweathermap.org/img/wn/50n@2x.png':
        return "assets/images/mist.png";
      default:
        return "https://spng.pngfind.com/pngs/s/132-1325896_cloud-with-exclamation-sign-inside-stroke-weather-warning.png";
    }
  }

  WeatherResponse({
    required this.cityName,
    required this.tempInfo,
    required this.weatherInfo,
    required this.countrySys,
    required this.wind,
  });
  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempratureinfoJson = json['main'];
    final tempInfo = TemparatureInfo.fromJson(tempratureinfoJson);
    final coutrySystJson = json['sys'];
    final countrySys = CountrySys.fromJson(coutrySystJson);
    final windjson = json['wind'];
    final  wind = Wind.fromJson(windjson);
    final WeatherInfoJson = json['weather'][0];
    final wetherinfo = WeatherInfo.froomJson(WeatherInfoJson);
    return WeatherResponse(
      cityName: cityName,
      tempInfo: tempInfo,
      weatherInfo: wetherinfo,
      countrySys: countrySys, wind: wind,
    );
  }
}
