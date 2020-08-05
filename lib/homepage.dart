import 'dart:convert';
import 'package:corona/pages/loadingpage.dart';
import 'package:flutter/material.dart';
import 'panels/worldpanel.dart';
import 'panels/mostcountries.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;
  List countryData;
  //get Worldwide data
  getWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    // print(worldData);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  getCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases#');
    // print(countryData);
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    getWorldWideData();
    getCountryData();
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Colors.lightBlue,
                  highlightColor: Colors.blue[50],
                  child: Text(
                    'Worldwide',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Piedra',
                        color: Colors.deepOrange),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: worldData == null || countryData == null
            ? LoadingPage()
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WorldPanel(
                        worldData: worldData,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          'Most Affected Countries',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MostCountries(countryData: countryData),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
