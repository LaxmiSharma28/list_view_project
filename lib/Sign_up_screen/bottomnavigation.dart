import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'btmnaviprofile.dart';

class BtmNavi extends StatefulWidget {
  const BtmNavi({super.key});

  @override
  State<BtmNavi> createState() => _BtmNaviState();
}

class _BtmNaviState extends State<BtmNavi> {
  int _currentIndex=0;

  final tabs=[
   Center(child: Text('Home')),
   Center(child: Text('Contact')),
   Center(child: Text('Search')),
    BtmNaviProfile(),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade500,
          title: Text(
            "Bottom Navigation Bar",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 40,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.deepPurpleAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: "Contact",
              backgroundColor: Colors.redAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.black,
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
        ));
  }
}
