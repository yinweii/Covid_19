import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class InforPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/logoo.jpg'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDiaglog(title: 'Dark Mode'),
                    );
                  },
                  child: MyCard(
                    icon1: Icon(
                      Icons.brightness_3,
                      size: 25,
                    ),
                    title: Text(
                      "Dark Mode",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    icon2: Icon(Icons.wb_incandescent),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomDiaglog(title: 'Review'),
                    );
                  },
                  child: MyCard(
                    icon1: Icon(
                      Icons.visibility,
                      size: 25,
                    ),
                    title: Text(
                      "Review",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    icon2: Icon(Icons.chevron_right),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          CustomDiaglog(title: 'Report and Suggestion'),
                    );
                  },
                  child: MyCard(
                    icon1: Icon(
                      Icons.info_outline,
                      size: 25,
                    ),
                    title: Text(
                      "Report and Suggestion",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    icon2: Icon(Icons.chevron_right),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'About Me ?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                AboutMe(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget icon1;
  final Widget icon2;
  final Widget title;

  const MyCard({Key key, this.icon1, this.icon2, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Card(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    this.icon1,
                    SizedBox(
                      width: 30,
                    ),
                    this.title,
                  ],
                ),
              ),
              this.icon2,
            ],
          ),
        ),
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/fblg.jpg'),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/intagram.jpg'),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('images/GitHub-Logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDiaglog extends StatelessWidget {
  final String title;

  const CustomDiaglog({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogConten(context),
    );
  }

  dialogConten(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0.0, 10.0)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.red[200],
                highlightColor: Colors.grey,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                'Coming Soon...',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlue),
              ),
              SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Okay',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 100,
          right: 100,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueAccent,
            backgroundImage: AssetImage('images/Octopus.gif'),
          ),
        ),
      ],
    );
  }
}
