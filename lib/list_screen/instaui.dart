import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class InStaUi extends StatefulWidget {
  const InStaUi({super.key});

  @override
  State<InStaUi> createState() => _InStaUiState();
}

class _InStaUiState extends State<InStaUi> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: (AppBar(
        title: Text("Instagram", style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(Icons.favorite, color: Colors.red, size: 30,),
          SizedBox(width: 20),
          Icon(Icons.message, color: Colors.white, size: 25,),
        ],
        backgroundColor: Colors.black,
      )
      ),
      backgroundColor: Colors.black,




            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 60.0,
              items: <Widget>[
                Icon(Icons.add, size: 30),
                Icon(Icons.list, size: 30),
                Icon(Icons.compare_arrows, size: 30),
                Icon(Icons.call_split, size: 30),
                Icon(Icons.perm_identity, size: 30),
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
              letIndexChange: (index) => true,
            ),
            body: Container(
              color: Colors.blueAccent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(_page.toString(), textScaleFactor: 10.0),
                    ElevatedButton(
                      child: Text('Go To Page of index 1'),
                      onPressed: () {
                        final CurvedNavigationBarState? navBarState =
                            _bottomNavigationKey.currentState;
                        navBarState?.setPage(1);
                      },
                    )
                  ],
                ),
              ),
            ),








    );
  }
}
