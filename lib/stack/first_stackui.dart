import 'package:flutter/material.dart';

class FirstStackUi extends StatefulWidget {
  const FirstStackUi({super.key});

  @override
  State<FirstStackUi> createState() => _FirstStackUiState();
}

class _FirstStackUiState extends State<FirstStackUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Stack'),
      ),
          body:Stack(children:
          [Container(


            color: Colors.lightGreenAccent,

          ),
            Stack(children: [
              Positioned(
                  top: 40,
                  bottom: 40,
                  left: 40,
                  right: 40,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ))
            ],

            ),
            Stack(children: [
              Positioned(
                top: 80,
                  bottom: 80,
                  left: 80,
                  right: 80,


                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                  ))
            ],),

            Stack(children: [
              Positioned(
                  top: 120,
                  bottom: 120,
                  right: 120,
                  left: 120,

                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.lightBlue,
                  ))
            ],),

            Stack(children: [
              Positioned(

                  top: 160,
                  bottom: 160,
                  right: 160,
                  left: 160,



                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.indigo,
                  ))
            ],),

            Stack(children: [
              Positioned(
                  top: 200,
                  bottom: 200,
                  right: 200,
                  left: 200,

                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.white,
                  ))
            ],)



          ],


    ),
    );
  }
}
