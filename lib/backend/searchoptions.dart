import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xiomi_weather_app/presentation/screens/homescreen.dart';

class SearchOption extends StatelessWidget {
  const SearchOption({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(searchOption.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5,),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(cityName: searchOption[index])));
              },
              child: Container(
                decoration: BoxDecoration(  
                  color: Colors.grey,
                  border:Border.all(
                    color: Colors.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Padding(padding:const EdgeInsets.only(left: 20, right: 25, top: 10,bottom: 10,),
                  child: Text(
                    searchOption[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ),
            ),
          );
        })
      ),
    );
  }
}

List searchOption = ['Dublin','SouthAfrica', 'zimbabwe', 'Ado-Ekiti'];