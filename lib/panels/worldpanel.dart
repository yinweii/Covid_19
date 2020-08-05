import 'package:flutter/material.dart';

class WorldPanel extends StatelessWidget {
  final Map worldData;

  WorldPanel({this.worldData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16,left: 8,right: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              color: Colors.grey[400],
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StatusPanel(
              count: worldData['cases'],
              title: 'Cases',
              color: Color(0xFF0509f7),
            ),
            StatusPanel(
              count: worldData['deaths'],
              title: 'Deaths',
              color: Colors.red,
            ),
            StatusPanel(
              count: worldData['recovered'],
              title: 'Recovered',
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final int count;
  final String title;
  final Color color;

  const StatusPanel({Key key, this.count, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(6),
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.26),
            ),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: color,
                    width: 2,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$count',
          style:
              TextStyle(fontSize: 20, color: color,fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$title',
          style: TextStyle(fontSize: 18, color: color),
        ),
      ],
    );
  }
}
