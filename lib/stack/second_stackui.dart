import 'package:flutter/material.dart';

class SecondStackUi extends StatefulWidget {
  const SecondStackUi({super.key});

  @override
  State<SecondStackUi> createState() => _SecondStackUiState();
}

class _SecondStackUiState extends State<SecondStackUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Stack'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(children: [
        Container(
          color: Colors.orange,
        ),
        Stack(children: [
          Positioned(
            top: 20,
              bottom: 580,
              right: 210,
              left: 20,



              child: Container(
                width: 150,
                height: 150,
                color: Colors.white,
              ))
        ],),

        Stack(children: [
          Positioned(
                 left: 220,
                  top: 20,
              right: 20,
            bottom:580 ,



              child: Container(
                width: 300,
                height: 300,
                color: Colors.lightGreenAccent,
              ))
        ],),

          Stack(children: [
            Positioned(
                  right: 120,
                  top: 300,
                left: 110,
                bottom: 300,




                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.pink,
                ))
          ],),

        Stack(children: [
          Positioned(
            top: 580,
             bottom: 20,
              left: 20,
              right: 210,


              child: Container(
                width: 150,
                height: 600,
                color:Colors.grey
              ))
        ],),

        Stack(children: [
          Positioned(
            top: 580,
              left: 220,
              right: 20,
               bottom: 20,
              child: Container(
                width: 385,
                height: 620,
                color: Colors.purpleAccent,
              ))
        ],)


      ],





      )





    );
  }
}


