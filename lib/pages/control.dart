import 'package:flutter/material.dart';
import '../homepage.dart';
import 'StroragePage.dart';
import 'countrypage.dart';
import 'inforpage.dart';

class ControlPage extends StatefulWidget {
  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int _lelectedItemIndex = 0;

  final List pages = [
    HomePage(),
    CountryPage(),
    StroragePage(),
    InforPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _lelectedItemIndex,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, color: Colors.blue),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.blue),
            title: Text(''),
          )
        ],
        onTap: (int index) {
          setState(() {
            _lelectedItemIndex = index;
          });
        },
      ),
      body: pages[_lelectedItemIndex],
    );
  }
}
