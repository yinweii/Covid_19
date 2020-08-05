import 'package:corona/pages/Search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  Future<void> getCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases#');
    setState(() {
      countryData = json.decode(response.body);
      // print(countryData);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              showSearch(context: context, delegate: Search(countryData));
            },
          )
        ],
        title: Center(
          child: Text(
            'Contries Stats',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'BungeeInline',
            ),
          ),
        ),
      ),
      body: countryData == null
          ?
          //ShimerPage()
          Center(
              child: SpinKitThreeBounce(
                color: Colors.lightBlue,
              ),
            )
          : ListView.builder(
              itemCount: countryData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 5,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xFFe8eddd),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Image.network(
                                countryData[index]['countryInfo']['flag'],
                                height: 55,
                                width: 70,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    countryData[index]['country'].toString(),
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: Color(0xFFc7381c),
                                        fontFamily: 'CreteRound',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(40, 3, 40, 0),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          ShowInfo(
                                              title: 'Cases:',
                                              color: Color(0xFF0509f7),
                                              count: countryData[index]
                                                  ['cases']),
                                          ShowInfo(
                                            title: 'Recovered:',
                                            color: Colors.green,
                                            count: countryData[index]
                                                ['recovered'],
                                          ),
                                          ShowInfo(
                                            title: 'Deaths:',
                                            color: Colors.red,
                                            count: countryData[index]['deaths'],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class ShowInfo extends StatelessWidget {
  final int count;
  final Color color;
  final String title;

  const ShowInfo({Key key, this.count, this.color, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                '$title',
                style: TextStyle(
                  fontSize: 20,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              child: Text(
                '$count',
                style: TextStyle(
                  color: color,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
