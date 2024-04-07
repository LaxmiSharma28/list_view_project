import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../image picker/image_picker_grid.dart';



class ImageProfile extends StatefulWidget {
  const ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;

  imageFromGallary() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = image;
      });

      print(pickedImage!.length());
      Navigator.pop(context);
    }
  }

  imageFromCamrea() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        pickedImage = image;
      });

      print(pickedImage!.length());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade100,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 550,
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 20),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 35),
                  Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                                width: 200,
                                height: 200,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    // border: Border.all(
                                    //     color: Colors.orangeAccent, width: 2),
                                    borderRadius: BorderRadius.circular(100)),
                                child: pickedImage != null
                                    ? Image.file(
                                        (File(pickedImage!.path)),
                                        fit: BoxFit.cover,
                                        height: 110,
                                        width: 110,
                                      )
                                    : const Icon(
                                        Icons.supervised_user_circle,
                                        size: 50,
                                      )),
                            Positioned(
                                top: 150,
                                left: 150,
                                height: 30,
                                width: 30,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.orangeAccent,
                                  child: Icon(
                                    Icons.create,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text("Choose Your Photo"),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        imageFromCamrea();
                                                      },
                                                      child: Icon(
                                                        Icons.camera_alt,
                                                        size: 50,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        imageFromGallary();
                                                      },
                                                      child: Icon(
                                                        Icons.upload_file,
                                                        size: 50,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ));
                                  },
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Mayme Cambcail",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: 45),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage("assets/images/user1.png"),
                            height: 40,
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "50",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text("Follow", style: TextStyle(fontSize: 16))
                            ],
                          ),
                          Image(
                            image: AssetImage("assets/images/user1.png"),
                            height: 40,
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "23",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Twitter",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          Image(
                            image: AssetImage("assets/images/user1.png"),
                            height: 40,
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "78",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "Done",
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.yellow.shade50,
              height: 350,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 35),
                        child: Text(
                          "IntroPlace",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.purple.shade300,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40, top: 10),
                              child: Text(
                                "Maldives",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.orangeAccent.shade200,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 40, top: 10),
                              child: Text(
                                "India",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.deepPurple,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 10),
                                  child: Text(
                                    "Paris",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                height: 50,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 10),
                                  child: Text(
                                    "Delhi",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Container(
                                height: 50,
                                width: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.pinkAccent,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 10),
                                  child: Text(
                                    "Chandigarh",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ImageGrid()));
                        },
                        child: Container(
                          height: 60,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.orange,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 150, top: 20),
                            child: Text(
                              "See Pictures",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
