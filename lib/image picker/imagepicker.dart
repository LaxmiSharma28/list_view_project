import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerSpl extends StatefulWidget {
  const ImagePickerSpl({super.key});

  @override
  State<ImagePickerSpl> createState() => _ImagePickerSplState();
}

class _ImagePickerSplState extends State<ImagePickerSpl> {
  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;

  imageFromGallary() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = image;
      });
      print(pickedImage!.length());


    }
  }

  imageFromCamera() async {
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        pickedImage = image;
      });
      print(pickedImage!.length());


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Test Image Picker",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red.shade300,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red.shade200),
                  child: pickedImage != null
                      ? Image.file(
                          (File(pickedImage!.path)),
                          fit: BoxFit.cover,
                          height: 200,
                        )
                      : const Icon(
                          Icons.supervised_user_circle,
                          size: 50,
                        )),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: () {
                  imageFromCamera();
                },
                child: Container(
                  color: Colors.green,
                  alignment: Alignment.center,
                  height: 50,
                  width: 80,
                  child: Text("Camera"),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  imageFromGallary();
                },
                child: Container(color: Colors.pink,
                  alignment: Alignment.center,
                  height: 50,
                  width: 80,
                  child: Text("Gallery"),
                ),
              ),
            ],
          ),
        ));
  }
}
//
// Future<void> imageFromGallary() async {
//   String BASE_PATH =''
// }