import 'package:flutter/material.dart';
import 'package:xiomi_weather_app/backend/data_service.dart';
import 'package:xiomi_weather_app/backend/models.dart';

class HomepageIcon extends StatefulWidget {
  const HomepageIcon({ Key? key }) : super(key: key);

  @override
  _HomepageIconState createState() => _HomepageIconState();
}

class _HomepageIconState extends State<HomepageIcon> {
  final _dataService = DataService();
  late WeatherResponse _response;
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}