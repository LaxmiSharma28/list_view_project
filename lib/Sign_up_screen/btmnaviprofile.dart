import 'package:flutter/material.dart';

class BtmNaviProfile extends StatefulWidget {
  const BtmNaviProfile({super.key});

  @override
  State<BtmNaviProfile> createState() => _BtmNaviProfileState();
}

class _BtmNaviProfileState extends State<BtmNaviProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            height: 150,
            child: Row(
              children: [
                Stack(children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                    AssetImage("assets/images/avtaar1.png"),
                  ),
                  Positioned(
                      bottom: -6,
                      right: -12,
                      child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Color(0xFFF5F6F9),
                        child: Icon(Icons.linked_camera_outlined,
                            color: Colors.black),
                        shape: CircleBorder(),
                      ))
                ]),
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Wick",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: Colors.white70,
                            size: 15,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "johnwick@gmail.com",
                            style: TextStyle(
                                fontSize: 15, color: Colors.white70),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(Icons.phone_outlined,
                              color: Colors.white, size: 15),
                          SizedBox(width: 5),
                          Text(
                            "+91123452345",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text.rich(TextSpan(
                              text: "Referral Code: ",
                              style: TextStyle(color: Colors.white70),
                              children: [
                                TextSpan(
                                    text: "JOHINI21 ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    children: [
                                      TextSpan(
                                          text: "Copy Code",
                                          style:
                                          TextStyle(color: Colors.pink))
                                    ])
                              ])),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Full Name",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 2),
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,)),
               disabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20),
                   borderSide: BorderSide(
                     color: Colors.white,
                     width: 2,)),

              prefixIcon: Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            hintText: 'Andrew Chadwick',
            hintStyle: TextStyle(color: Colors.white),),
        ),
        SizedBox(height: 10),
        Text(
          "Email",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 2),
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,)),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            hintText: 'andrew@gmail.com',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Phone Number",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 2),
        ),
        TextField(
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,)),

              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,)),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              hintText: '(+1)| 331-623-8413',
              hintStyle: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 40),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 190,
                  height: 60,
                  child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,)),

                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,)),
                        hintText: '  02-03-1995',
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                      )),
                ),
                SizedBox(width: 10),

                Container(
                  width: 170,
                  height: 60,
                  child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,)),

                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,)),

                        hintText: ' Male',
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 40),
        GestureDetector(
            onTap: () {},
            child: Container(
              width: 420,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.pink.shade600,
                      Colors.purple.shade600
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Save",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ))
        ],
      ),
    ),)
    ,
    );
  }
}
