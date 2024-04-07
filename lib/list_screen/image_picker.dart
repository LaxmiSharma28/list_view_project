import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;

  imageFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = image;
      });
      print(pickedImage!.length());
      Navigator.pop(context);
    }
  }

  imageFromCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Image Picker Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
                alignment: Alignment.center,
                height: 110,
                width: 110,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.grey),
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
                top: 70,
                left: 70,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    backgroundColor: Colors.red[900],
                    child: const Icon(Icons.create, size: 25),
                    onPressed: (() {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Container(
                                  height: 50,
                                  width: 70,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: (() {
                                          imageFromCamera();
                                        }),
                                        child: const Icon(
                                          Icons.camera_alt,
                                          size: 50,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (() {
                                          imageFromGallery();
                                        }),
                                        child: const Icon(
                                          Icons.upload_file,
                                          size: 50,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                    }),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
