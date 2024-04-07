import 'package:flutter/material.dart';

class DrawerUi extends StatefulWidget {
  const DrawerUi({super.key});

  @override
  State<DrawerUi> createState() => _DrawerUiState();
}

class _DrawerUiState extends State<DrawerUi> {
  bool click = true;
  bool show = true;
  bool change = true;
  bool check = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.blue.shade700,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue.shade900),
                  child: Column(
                    children: [
                      Text(
                        "AVTAAR",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/avtaar.webp'),
                      ),
                    ],
                  )),
            ),
            Container(
              color: (click == false) ? Colors.amber : Colors.transparent,
              child: ListTile(
                onTap: () {
                  setState(() {
                    click = !click;
                  });
                },

                leading: Icon(Icons.drive_file_rename_outline),
                title: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade700,
                  ),
                ),
              ),
            ),
            Container(
              color: (show == false) ? Colors.pink : Colors.transparent,
              child: ListTile(
                onTap: () {
                  setState(() {
                    show = !show;
                  });
                },
                leading: Icon(Icons.email_outlined),
                title: Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade700),
                ),
              ),
            ),
            Container(
              color: (change == false) ? Colors.yellow : Colors.transparent,
              child: ListTile(
                onTap: () {
                  setState(() {
                    change = !change;
                  });
                },
                leading: Icon(Icons.phone),
                title: Text(
                  "Contact",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade700),
                ),
              ),
            ),
            Container(
              color: (check == false) ? Colors.purpleAccent : Colors.transparent,
              child: ListTile(
                onTap: () {
                  setState(() {
                    check = !check;
                  });
                },
                leading: Icon(Icons.logout),
                title: Text(
                  "LogOut",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade700),
                ),
              ),
            )
          ],
        ),
      ),
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
                      alignment: Alignment.topCenter,
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
