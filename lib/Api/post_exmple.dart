import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'PostModal.dart';

class PostExample extends StatefulWidget {
  const PostExample({super.key});

  @override
  State<PostExample> createState() => _PostExampleState();
}

class _PostExampleState extends State<PostExample> {
  var oneController = TextEditingController();
  var twoController = TextEditingController();
  var threeController = TextEditingController();

  PostModal modal = PostModal();
  bool isLoading = false;

  postData(String name, String salary, String age) async {
    var response = await http.post(
        Uri.parse("https://dummy.restapiexample.com/api/v1/create"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'name': name,
          'salary': salary,
          'age': age
        });
    print({'name': name, 'salary': salary, 'age': age});
    if (response.statusCode == 200) {
      print(response.body);
      var responseData = jsonDecode(response.body);
      modal = PostModal.fromJson(responseData);
      setState(() {});
    } else if (response.statusCode == 400) {
      throw Exception('<<<<<<<<<<Failed to delete data>>>>>>>>>>');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Api",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(

              controller: oneController,
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(height: 20),
            TextFormField(

              controller: twoController,
              decoration: InputDecoration(
                  labelText: "Salary",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(

              controller: threeController,
              decoration: InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.cyanAccent.shade100,
              ),
              child: TextButton(
                  onPressed: () {
                    postData(oneController.text, twoController.text,
                        threeController.text);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(height: 10),
            Text(modal.message.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            SizedBox(height: 10),

            // SizedBox(height: 10),
            // Text(modal.data!.name.toString()),
            // SizedBox(height: 10),
            // Text(modal.data!.salary.toString()),
            // SizedBox(height: 10),
            // Text(modal.data!.age.toString()),
          ],
        ),
      ),
    );
  }
}
