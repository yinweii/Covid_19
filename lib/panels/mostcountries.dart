import 'package:corona/pages/detial.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MostCountries extends StatefulWidget {
  final List countryData;

  const MostCountries({Key key, this.countryData}) : super(key: key);

  @override
  _MostCountriesState createState() => _MostCountriesState();
}

class _MostCountriesState extends State<MostCountries> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => tapQQ(this.widget.countryData[index]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Container(
                height: 90,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Container(
                        height: 50,
                        width: 65,
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
                          child: Container(
                            child: Image.network(
                              widget.countryData[index]['countryInfo']['flag'],
                              height: 20,
                              width: 35,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60, top: 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              widget.countryData[index]['country'].toString(),
                              style: TextStyle(
                                fontSize: 23,
                                color: Color(0xFF362024),
                                fontFamily: 'CreteRound',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Container(
                                child: Center(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.skull,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.countryData[index]['deaths']
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapQQ(countryData) {
    //print('$countryData');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetialPage(countryData: countryData)));
  }
}
