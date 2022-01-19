import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xiomi_weather_app/backend/data_service.dart';
import 'package:xiomi_weather_app/backend/models.dart';
import 'package:xiomi_weather_app/presentation/screens/homescreen.dart';

class CityWether extends StatefulWidget {
  final String cityName;
  const CityWether({Key? key, required this.cityName}) : super(key: key);

  @override
  State<CityWether> createState() => _CityWetherState();
}

class _CityWetherState extends State<CityWether> {
  bool loading = false;
  bool Day_Night = false;
  @override
  void initState() {
    loading = true;
    WetherRequest(widget.cityName);
    super.initState();
  }

  final _dataService = DataService();
  late WeatherResponse _response;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return loading
            ? Container(
              height: size.height * 0.23,
              width: size.width * 0.33,
              child: const SpinKitFadingCircle(
            color: Colors.blue,
            size: 50.0,
          )
            )
            :
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(cityName: _response.cityName)));
        },
        child:  Container(
                height: size.height * 0.24,
                width: size.width * 0.33,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, -1), //(x,y)
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        _response.cityName,
                        style:   GoogleFonts.abel(
                          color: Day_Night ? Colors.grey.shade300: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(_response.iconurl, height: 90, width: 90,),
                          Text(
                            _response.weatherInfo.description,
                            style:   GoogleFonts.abel(
                              color:Day_Night ? Colors.grey.shade300: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${_response.tempInfo.temparature.round()} °C',
                        style:   GoogleFonts.abel(
                          color: Day_Night ? Colors.grey.shade300: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  void WetherRequest(String city) async {
    final response = await _dataService.getWeather(city);
    setState(() {
      loading = false;
      _response = response;
    });
    if (_response.iconurl == 'assets/images/clear_sky_nigt.png') {
        setState(() {
          Day_Night = true;
        });
      }
  }
}
