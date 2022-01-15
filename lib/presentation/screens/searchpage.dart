import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:xiomi_weather_app/backend/searchoptions.dart';
import 'package:xiomi_weather_app/presentation/screens/homescreen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TextField(
                  controller: searchController,
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black.withOpacity(0.3),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              searchOption.add(searchController.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(cityName: searchController.text)));
                            },
                            child: Text('Go')),
                        ),
                        hintText: ' search...',
                        hintStyle:
                            GoogleFonts.abel(color: Colors.black, fontSize: 20),
                        prefixIcon: const Icon(
                          LineIcons.search,
                          color: Colors.black,
                        )),
                  ),
        ),
      ),
              const SizedBox(
                height: 20,
              ),
              SearchOption(),
            ]),
          ),
        ),
      ),
    );
  }
}

