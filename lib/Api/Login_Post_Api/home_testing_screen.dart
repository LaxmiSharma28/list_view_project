import 'package:flutter/material.dart';

class GetTesting extends StatefulWidget {
  const GetTesting({super.key});

  @override
  State<GetTesting> createState() => _GetTestingState();
}

class _GetTestingState extends State<GetTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("GET API TEST",style: TextStyle(color: Colors.white,),
     ),
   centerTitle: true,
   leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.transparent,)),
     backgroundColor: Colors.deepPurpleAccent,),
    );
  }
}
