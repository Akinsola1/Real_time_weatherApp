import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:xiomi_weather_app/presentation/screens/searchpage.dart';

import '../../backend/data_service.dart';
import '../../backend/models.dart';
import '../../backend/weather.dart';

class HomeScreen extends StatefulWidget {
  final String cityName;
  const HomeScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;
  bool error = false;
  bool Day_Night = false;
  @override
  void initState() {
    super.initState();
    loading = true;
    WetherRequest(widget.cityName);
  }

  final _dataService = DataService();
  late WeatherResponse _response;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return loading
        ? const Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            ))
        : Scaffold(
            backgroundColor: Day_Night ? Colors.grey.shade800 : Colors.grey,
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchPage()));
                                    },
                                    icon: Icon(Icons.add),
                                    color: Colors.black),
                                const Spacer(),
                                Text('Today',
                                    style: GoogleFonts.abel(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Day_Night
                                          ? Colors.grey.shade300
                                          : Colors.black,
                                    )),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(LineIcons.verticalEllipsis),
                                    color: Colors.black),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${_response.cityName}, ',
                                  style: GoogleFonts.abel(
                                      fontWeight: FontWeight.w400,
                                      color: Day_Night
                                          ? Colors.grey.shade300
                                          : Colors.black,
                                      fontSize: 25),
                                ),
                                Text(
                                  _response.countrySys.country,
                                  style: GoogleFonts.abel(
                                    fontSize: 25,
                                    color: Day_Night
                                        ? Colors.grey.shade300
                                        : Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Image.asset(
                              _response.iconurl,
                              height: 120,
                              width: 120,
                            ),
                            Text(
                              '${_response.tempInfo.temparature.round()}°C',
                              style: GoogleFonts.abel(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 100,
                              ),
                            ),
                            Text(_response.weatherInfo.description,
                                style: GoogleFonts.abel(
                                    color: Day_Night
                                        ? Colors.grey.shade300
                                        : Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    WeatherIcons.raindrop,
                                    color: Day_Night
                                        ? Colors.grey.shade300
                                        : Colors.black,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${_response.tempInfo.humidity}%',
                                    style: GoogleFonts.abel(
                                        fontSize: 23,
                                        color: Day_Night
                                            ? Colors.grey.shade300
                                            : Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: const [
                                  CityWether(cityName: 'London'),
                                  CityWether(cityName: 'Italy'),
                                  CityWether(cityName: 'Ghana'),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: size.height * 0.3,
                              width: size.width * 0.91,
                              decoration: BoxDecoration(
                                  color: Day_Night
                                      ? Colors.grey.shade600
                                      : Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: loading
                                  ? Container(
                                      height: size.height * 0.3,
                                      width: size.width * 0.91,
                                      decoration: BoxDecoration(
                                          color: Day_Night
                                              ? Colors.grey.shade600
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Center(
                                        child: SpinKitFadingCircle(
                                          color: Colors.blue,
                                          size: 50.0,
                                        ),
                                      ))
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 20),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Details',
                                            style: GoogleFonts.abel(
                                              fontSize: 20,
                                              color: Day_Night
                                                  ? Colors.grey.shade300
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Feels like',
                                                      style: GoogleFonts.abel(
                                                        color: Day_Night
                                                            ? Colors
                                                                .grey.shade400
                                                            : Colors.grey,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${_response.tempInfo.feelsLike}°C',
                                                      style: GoogleFonts.abel(
                                                        fontSize: 20,
                                                        color: Day_Night
                                                            ? Colors
                                                                .grey.shade500
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.3,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Pressure',
                                                      style: GoogleFonts.abel(
                                                        color: Day_Night
                                                            ? Colors
                                                                .grey.shade400
                                                            : Colors.grey,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${_response.tempInfo.pressure}mbar',
                                                      style: GoogleFonts.abel(
                                                        fontSize: 20,
                                                        color: Day_Night
                                                            ? Colors
                                                                .grey.shade500
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ]),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Wind speed',
                                                      style: GoogleFonts.abel(
                                                        color: Day_Night
                                                            ? Colors
                                                                .grey.shade400
                                                            : Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${_response.wind.speed}Km/h',
                                                      style: GoogleFonts.abel(
                                                        fontSize: 20,
                                                        color: Day_Night
                                                            ? Colors
                                                                .grey.shade500
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.3,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Humidty',
                                                      style: GoogleFonts.abel(
                                                        color: Day_Night
                                                            ? Colors
                                                                .grey.shade400
                                                            : Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${_response.tempInfo.humidity}%',
                                                      style: GoogleFonts.abel(
                                                        fontSize: 20,
                                                        color: Day_Night
                                                            ? Colors
                                                                .grey.shade500
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ])
                                        ],
                                      )),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  void WetherRequest(String city) async {
    try {
      final response = await _dataService.getWeather(city);
      setState(() {
        _response = response;
        loading = false;
        print('sucess');
      });
      if (_response.iconurl == 'assets/images/clear_sky_nigt.png') {
        setState(() {
          Day_Night = true;
        });
      }
    } catch (e) {
      setState(() {
        Navigator.pop(context);
        loading = false;
        error = true;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Error"),
                content: Text(
                    "Unable to generate weather info, check spelling or internet connection"),
              );
            });
      });
    }
  }
}
