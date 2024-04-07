import 'package:flutter/material.dart';

class ThirdStackUi extends StatefulWidget {
  const ThirdStackUi({super.key});

  @override
  State<ThirdStackUi> createState() => _ThirdStackUiState();
}

class _ThirdStackUiState extends State<ThirdStackUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.blue,
         title: Text('Third Stack'),
       ),
            body: Stack(children: [Container(
              color: Colors.grey,

            ),
              Stack(children: [
                Positioned(
                    child: Container(
                      width: 180,
                      height: 300,
                      color:Colors.orange
                    ))
              ],),
              Stack(children: [
                Positioned(
                    left: 220,



                    child: Container(
                      width: 200,
                      height: 300,
                      color: Colors.pink,
                    ))
              ],),
              Stack(children: [
                Positioned(
                   top: 450,
                    right: 0,
                    left: 220,

                    child: Container(
                      width: 200,
                      height: 790,
                      color: Colors.redAccent,
                    ))
              ],),

              Stack(children: [
                Positioned(
                   top: 450,
                    bottom: 0,


                    child: Container(
                      width: 180,
                      height: 300,
                      color: Colors.indigoAccent,
                    ))
              ],)











            ],),





    );
  }
}
