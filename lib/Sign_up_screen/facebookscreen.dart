import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewScreenUi extends StatefulWidget {
  const NewScreenUi({super.key});

  @override
  State<NewScreenUi> createState() => _NewScreenUiState();
}

class _NewScreenUiState extends State<NewScreenUi> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blue.shade800));

    return Scaffold(


      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue.shade300, Colors.indigo.shade600],
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/img1.png",
                      alignment: Alignment.center,
                      color: Colors.white,
                    ),
                  )),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "It`s easier to sign up now",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        height: 55,
                        width: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.blue.shade600,
                                Colors.indigo.shade600
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 35,
                            ),
                            Text(
                              "Continue with facebook",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        "I`ll use email or phone",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image.asset("assets/images/Facebook-logo.png",
                        height: 40),
                  ),
                  Row(
                    children: [
                      Container(
                        child:
                            Image.asset("assets/images/img3.jpg", height: 40),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child:
                            Image.asset("assets/images/whats.png", height: 40),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text.rich(TextSpan(
                text: 'Already have a account? ',
                style: TextStyle(
                    color: Colors.grey.shade600, fontWeight: FontWeight.w600),
                children: const [
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      color: Colors.blue,
                    ),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 350);
    path.quadraticBezierTo(size.width / 4, 270, size.width / 2, 340);
    path.quadraticBezierTo(3 / 4 * size.width, 395, size.width, 340);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
