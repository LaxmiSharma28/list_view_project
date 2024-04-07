import 'package:flutter/material.dart';

class FaceBookUi extends StatefulWidget {
  const FaceBookUi({super.key});

  @override
  State<FaceBookUi> createState() => _FaceBookUiState();
}

class _FaceBookUiState extends State<FaceBookUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Image(image: AssetImage("assets/images/fb.png"),),
                Text("Sign Up",style: TextStyle(color: Colors.lightBlue.shade900,fontSize: 50,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
