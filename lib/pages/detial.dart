import 'package:flutter/material.dart';

class DetialPage extends StatelessWidget {
  final countryData;

  const DetialPage({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(countryData['countryInfo']['flag']),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                countryData['country'].toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.red,
                ),
              ),
              CardInfor(title: 'Cases', count: countryData['cases']),
              CardInfor(title: 'Recovered', count: countryData['recovered']),
              CardInfor(title: 'Deaths', count: countryData['deaths']),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                width: 70,
                child: Image.asset('images/world512.png'),
              ),
              Text(
                countryData['continent'].toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardInfor extends StatelessWidget {
  final String title;
  final int count;

  const CardInfor({Key key, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 60,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
