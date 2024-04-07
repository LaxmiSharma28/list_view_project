import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiTest extends StatefulWidget {
  const ApiTest({super.key});

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Test"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 250,left: 50),
        child: Container(
          height: 400,
          width: 320,
          decoration: BoxDecoration(
            color: Colors.cyan.shade200,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.cyan,width: 3)
          )
          ,
          child: Center(
            child: FutureBuilder(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Activity :- ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,)),
                            Text("${snapshot.data!.activity}",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Participants :- ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("${snapshot.data!.participants}",style: TextStyle(fontSize: 18)),
                          ],
                        ),

                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Type :- ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20), ),
                          Text("${snapshot.data!.type}",style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Price :- ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),) ,
                            Text("${snapshot.data!.price}",style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Accessibility :- ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("${snapshot.data!.accessibility}",style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Link :- ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                              Text("${snapshot.data!.link}",style: TextStyle(fontSize: 18)),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Key :- ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            Text("${snapshot.data!.key}",style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://www.boredapi.com/api/activity'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  String? activity;
  String? type;
  dynamic participants;
  dynamic price;
  String? link;
  dynamic key;
  dynamic accessibility;

  Album(
      {this.activity,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key,
      this.accessibility});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      activity: json['activity'],
      participants: json['participants'],
      type: json['type'],
      key: json['key'],
      price: json['price'],
      accessibility: json['accessibility'],
      link: json['""'],
    );
  }
}
